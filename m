Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B6CE9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=; b=hn0PtYBgQZuhYcU86N0ZA89diV
	+B8nk+hnx6CIaWSFj6487eqs8xHIJbJFLS9/IviQAxg2jij81O9g+j+3IFtor0En338WWCWocLwVN
	oXiDRhwHq9oEa4tAlHi3ho1r6g8zQbf2jWyAwpGYfYb/3EUZJjSSFW9ISMuKT5UuMqARtbU3ZtfLk
	wtcaK+K4Eh7jeOXs9FX7A0QTTSGdm+GM9U1pjzO10osXvWgTlCAkqGzBM/5m8ifGWnvEpx79S2WT1
	rcMrWHsBOiRZjChByCERV8BTSg1BXuAwRZ0pTEJkou4pUjH8Sf3Q22xfAwiNj06d0Eq1jWB5rz4/Q
	MY+LFSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPxl-00000008je6-32CJ;
	Tue, 17 Feb 2026 18:38:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPxh-00000008jdY-3biy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:38:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB40mU1943469
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Khu6RsTg2hdw2N3mhPZSZ9W
	t5OAieYqZleD6YS06YA=; b=PiBXBHMSNCqQwgLRnydrG3YVTrHMg3v9Dt5jPg4T
	HIN+9sJM3DnR7cIZR8VrhYuaZDNqANZcm9Wkw6R+ko33mqs8RgzahmSeZSYLkc8s
	ZPIM1oalh1dcL5dKZNPSeArk7U3iDcfgjswXPl82oe4WI8GEJS3NzVt74ct7D4mT
	923Agy7keBPoncdbs0sMwNdbBsYnu7P9gtZykcMeTNVc3BdBp8fF7ERrApkjklms
	egYhRZRZ1zTJqcBhqHbnm1YXMd7R13I6l/VxnUwVr2eVcIkA5pQzq/lYE01rZx0z
	V8moE+VUhnCub9TvxjO2xLAmebp6FpY5dvUkcZ77wUC4lA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g1f63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:38:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so240880725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353496; x=1771958296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=;
        b=ikH2hYbTGiHjRPGd0dHhQxdz6X+zZ5woE00P0EQw8Pig04x25JCvbRBvAF6ajHeqVg
         2JSaE2oGP1mSZksoU0enXnkwTZ84Q6m4rtic22xaMuIJL+uQsHaMOXxtTXbIwZmiKAmX
         zC7wYr17z0lYWWIAzmMycl7jfUiqDNEFt41Qk4EhxHTV9UqZArI0yKA+ac64KyYrMtLo
         G3lqtBR3E4OQpWi65d40fo/JBsuno54YxQc2Lolr4zfzBhZ6wHkPfi9b8yAeWew8dExx
         5v+BQK9EmDuez19rtrat9uL/BXmyHkanRNbJCZ1+p5XEGM+qwNg9HXLQLxoQzbut5YRS
         0y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353496; x=1771958296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=;
        b=LN/OWHSvKbJy0rWdU+ju9bBYQHNxDdN6r0LZaaHKSNmpu8/rKpY+jHVeP6IKCpmmEr
         ++c6MRhlrKPblBNnz+D3j9kH54mJC6vsxnnzHjN5G9WY2Iz4Xqq08YweGYn1vUFKOtRL
         DYENXs6h+5o9XTUtbdRo2nO3a9r4G5tbvHyb3vrIY2j2BPHIuxzR7LhpNIL+iLiwwAjW
         38MFXnCQZy5Rk9dRjjLjS97amLLcB1/Jmuu+6Ayvd4BWFajmya5n0rmnW4VD1yElHkay
         tpX4VVtBKERmYUn1/AOJfAdDKUw4cpP4uU8l+ijV2dmkMaC49+S9Sa0gK7x7YcNwXr2n
         XuCg==
X-Forwarded-Encrypted: i=1; AJvYcCWyl6LfEBZxSMvi62v5ZrtwrEJXZwJSRrKuXJOa+bFeekqI7fEytZIRBpONRgcpNwP+/PzIeo9B3NiRP5/hL3lw@lists.infradead.org
X-Gm-Message-State: AOJu0YyHKPFVzE4byi0TDL6dfqNrVdn0tMs2GBzScdYyCH/H4iTw8kBH
	vj8YnnA4FQjihyjjlymhGqpDDj0THF9JhfbtTfgFSpkMoKRnOoK1p/EyCfz4o3E0j/9wU5h620J
	yxYy/vyId030h7SnQiEcIi5VLfYtauxXkgy+s463CjbcSiGaAF2rCDW5bVHGRtDXPqAIwAZhxuG
	NHJg==
X-Gm-Gg: AZuq6aJZ7Wi4l1Qd5lw+4S0iNSJabdIMbiUwN5f6FDxWbCq8CY1PfsCfwANgaD6Ju5f
	kZ6eOk5f3F5HFgW4i6fVaM5ZHbRpWZHVFnY6KI1R0IbwUnKusvVpfzRbcwIu9Vk7IDWsKq/ZnyQ
	ZagwMhjRwFnyMUYnR2P4piVTjkWeLjNzG3o8O8f2VCVMs5I6iT6qWbeqUo5mPsqI5pA6dXEdDHK
	bEVUuOk0myjx33TQrVyHtcp9leRt+v677J6tvcmGnZCFTXGM+nOTk9Hm7yMfJIQZhvIq3fjopQH
	F/qXBzaFxDvWZ2F5qrBKErREgJ7kfRoPayq4wmQFsid5H19QvJ3NXZa4S/1zyjUomKdCA2Hn/Xg
	ReQbVtw7iQSOrfjfNBU+HxcETbb1Tv2Qp33c=
X-Received: by 2002:a17:902:cf05:b0:295:565b:c691 with SMTP id d9443c01a7336-2ab505173b2mr154968035ad.17.1771353495767;
        Tue, 17 Feb 2026 10:38:15 -0800 (PST)
X-Received: by 2002:a17:902:cf05:b0:295:565b:c691 with SMTP id d9443c01a7336-2ab505173b2mr154967765ad.17.1771353495260;
        Tue, 17 Feb 2026 10:38:15 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aaf4b31sm100667375ad.86.2026.02.17.10.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:38:14 -0800 (PST)
Date: Wed, 18 Feb 2026 00:08:08 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 5/9] net: stmmac: qcom-ethqos: move loopback
 disable to .mac_finish()
Message-ID: <aZS1kIrwBFdwH8Zw@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX0UL/qvoodp/9
 eW5YnPQaq0jzuHJAbpmT45dMXV/Ox8crpat6zNSmioGilJHCctKwVP+Bwz9sDTKV44FmoSWZ2g/
 n7/YR7/4YKxeqmNNgF4E5FheSPHNFRU6k1eaa77AXqMQq/zNXKOWIK2BOtNIatPKk3unAi0R3JN
 /ZIT+6vXp912c+73GhMNe/x+sRilsdRJRveLaEOLk9TmyHBzOsgpsbjeWDv12QYa9jf17ogj1/t
 Z8otYLS4QLP+YKUifoPuWVwIe1yGc945QUfdFRWOW5j2o9jBrnIP9zEoTfGRlNHbx0DPRvHgP5I
 p8+nM0+4LsdJPYxSDXU1Fbz4lOtfzULqu0fF6I95AD2FPkBNgoDhulo9jUlfHkyFqCnP5+9vnsF
 wY167YMPCef6Wu1ZEJTM5uYs3Tjk09wIuB+WjpmoGKdzZNKUOoUsaSlHQqxiiGXnCx6XchuU2xF
 1TN4UCiMW4ikq19SG8g==
X-Proofpoint-ORIG-GUID: xMwanuz71qMKG78AGB_KAImGsItOOXS_
X-Proofpoint-GUID: xMwanuz71qMKG78AGB_KAImGsItOOXS_
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994b598 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=wi4T-LJhgm9Wf8MEqCEA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_103818_717340_9C0302B2 
X-CRM114-Status: GOOD (  16.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 12, 2026 at 12:18:06AM +0000, Russell King (Oracle) wrote:
> Loopback is enabled to allow the dwmac soft reset to succeed. This
> is enabled when clocks are enabled in ethqos_clks_config(), which
> happens at driver probe and runtime PM resume - e.g. when the
> network device is administratively brought up.
> 
> Currently, the loopback is disabled when the link comes up (via
> .mac_link_up() calling this driver's .fix_mac_speed().)
> 
> Move the qcom_ethqos_set_sgmii_loopback() call which disables
> loopback from ethqos_fix_mac_speed() into ethqos' SerDes specific
> .mac_finish() method so that loopback is disabled a little earlier
> after reset has completed, and dwmac setup has completed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

