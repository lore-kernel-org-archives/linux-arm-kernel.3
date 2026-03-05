Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D459FF47CC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brQJvLzGSg1FNHbunEnKNL87CiKohImsgvm9vmEVnZc=; b=OiA3AthVJVC4BYJlW0uB+t2LSA
	XDyVheiNI2bJMSulZxwtCsGwttIkUa7Uk9ZT9UcoazmVrbG91Ya8D006vSV671/ZkLiBUTHBC3Z7H
	BhV0PeOgsQTg6/8ge9Vk0FKI0ZOt214LHVn7cwe8V48PgKQV3hG9SBYrIXYSMjQn0o7uEFPdwg/Tj
	9HuZMfr6OC1vjCOk+J24Qllcmaoaq8qy+tIXCTViRa+KSqLbW0WVYspaAxHHrvrjnuMTBFPEZ4WV0
	X12H385AE+SHpgYbRDXcviNBiyW32j0/wlwAZi/FELFzrDGZSucD2sXLAnT1rUDrhGSH7TMO/F/Tn
	ghiyuLAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEgY-00000002Tar-0MaH;
	Thu, 05 Mar 2026 19:48:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEgV-00000002Ta8-1me5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:48:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625HoWqe1517955
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 19:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=brQJvLzGSg1FNHbunEnKNL87
	CiKohImsgvm9vmEVnZc=; b=HWRqKTXJDv9CRYuHW6AkxIrJUi7AT0CwdvxIMPMZ
	yAhmVgLfj0z5w+OFNPRT0xQisHx8Yt3UK/+vQxGxX5KP0P7CzKR7LFaCi/rUII9E
	9pgY+Av8R1//h3p6JXQZj+ry8vPl946OxRAVDnma8KigEffmCR1PpKOuMqu1T28p
	PDg1SVQxMnlvDrEdfw3p/0bXfrH9+XV18D9NCZnVbdDjMqzfBfx0JOOtMfYUYNd+
	as/StFXtjiEoONus6618GPgkciGX4LRf1N72Ec4j5X62GOxVZeGIPef4w3N1Vffs
	I0UYBAAOnW8v1wuRjJhwoVBQnLipRjXuOisw+AGegYL+hg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptm8k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 19:48:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae502a1dd9so60463305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772740114; x=1773344914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=brQJvLzGSg1FNHbunEnKNL87CiKohImsgvm9vmEVnZc=;
        b=JFOdNWYtHUzCZbytGeMVNxS+s7m/5CKHntYBpO3kguU4uhAoYajFTEaQxM/GoinzFD
         Ge141t7DrZNDWfTCWXNGqELm/fgpBhB9VJ4XAzC0pjARpsnlXNx8Elcn7U6baNdzKeS/
         SPSjTOEQqEw/gdqMuAVmi7/UhyjOKLonRAlLa+RUVaidYwG/HWmh29hxbw5TYKEGTyVC
         bTZLQWFjboy0yUVLkdn3KS4k2Twn9QBCMsnsN+9X++VnDPXRTayhDvi+L1Bze9XaPeJa
         N3CoYg2i7TKIE6Gu8q6bkz2GoFzAm926avgBIIUKKQmVsDboZT5YSBT/dJt3Y+BG9i4g
         f/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772740114; x=1773344914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brQJvLzGSg1FNHbunEnKNL87CiKohImsgvm9vmEVnZc=;
        b=PngdJ7dQIOr1wV5mb+XbeB4uQXU41UiLSD+GIQbDXhtgYJt0KY/8Xj0Bkcj35gX4Bw
         iDnsHVL2bSjgXriz8xsV/V8e4zUs1xctZITKMqcUWIJLF55/xGus7lrpH/jTe2V3ob6S
         tv74SwQvm3SoHgJXV/lkfOyX792LtyRLBCr18NFPrrnSegyLOAgQXutIFHl69DtIWvy+
         ZyZ26wIsy64nFWyOU+NuO/Sntemz1O7gbVs7JrFBZsnNIUkylJu5P5sZkEFkuKt0+J7d
         kB7wmC9htOhfj/ZTh5t2U8jMUOy5dp6DchcSwqhxqq8v+y00hseQJlh9Z5ZeLwpHVVon
         a6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzvjq0Qi18S3HoYdbGtMKpi8TwQ09bsZiKxBIU4Udqt4EDkXRJ3CMmSyLtzl/vP7WxU133d3lp5474nPi1onuC@lists.infradead.org
X-Gm-Message-State: AOJu0YzB+oNLs4fwDYflQ3rB78pvNQLvj7Sm+ouwuuiqBtnxzkLeOTI6
	sXCCJnkMWHIFtKwdch0Bbo5oTWt/LbMzi2uCRswjJzHUQJk5chpHJgXj5Fgf9oN0DUEjBlp9aVp
	KArRDqu5dAvbA1v2512Y9SFQBoufywsE/6dgX0LW2E2AT9tQDszQF/luzB1Jsr7vE4x7CMjSwTT
	QS9g==
X-Gm-Gg: ATEYQzwwjPCL6ZcSmPtZOSdNTqiMhXaZPRWzxGC86dw2mIQmEHj33fyypH1t6qzGJe9
	weq3M9Lxr7ZQMV7B5k9LwPw32ppbsiZlFGm+wd1DRztWKnm7ZpN5WGvngzGs9TJTYWf9q43l3p+
	FaN/Ha9eugAlLzYZTu8FMWO7andXcySfV0uGoMEVFOxKZNuOTUALEEvTLRYkB6jpN4haLPBdWEX
	UBtYW7UqfWU66ycMnysaKqgLncqV4xrwm4U7gDEPRgY++/kb8mL5LjFsiSJUKiltEV7HIjyY3Q0
	f2nYqcwq5mNB+72EQJe3J4qCUE/Lh5+PSXbxXkarJig2PkfMOVjj2SE09akSxMqyWT1/rczmxyv
	ORpIlq9ixGZMSbNZ0CbNCOTARj26K1d+p/b8=
X-Received: by 2002:a17:903:2c03:b0:2ad:ad0f:bbc3 with SMTP id d9443c01a7336-2ae6aab2710mr80733125ad.33.1772740114023;
        Thu, 05 Mar 2026 11:48:34 -0800 (PST)
X-Received: by 2002:a17:903:2c03:b0:2ad:ad0f:bbc3 with SMTP id d9443c01a7336-2ae6aab2710mr80732835ad.33.1772740113587;
        Thu, 05 Mar 2026 11:48:33 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4dcf80f2sm127371555ad.90.2026.03.05.11.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:48:33 -0800 (PST)
Date: Fri, 6 Mar 2026 01:18:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 2/7] net: stmmac: qcom-ethqos: convert to use
 phy_set_mode_ext()
Message-ID: <aaneCvwkgMOLFsVl@oss.qualcomm.com>
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
 <E1vxS44-0000000BQXU-38lG@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vxS44-0000000BQXU-38lG@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NSBTYWx0ZWRfX8AiXEW0pwDln
 8aViX0fPEWW6OenS9BxfEiLRoO7Lubg/KcFjDa3iCHAJamsXUn91lqhDtCxLfyw3Fr0oFaRqvSX
 O8dPjbIhOJ1POf7KL/kj5lZ2Uti9hnMH38UyyaT+1zJfbjl5SNQ8l8VthAs+seMvAT+LjuOMaoQ
 N+IAmuza8BphGHw/bFSXLL1xA1IVVaZlBkcheAiC/0zOH0Co6n57Xl2ACVDWN4cbWQd3iDR5AJb
 GxDKnq3Iqc7NKhDyh9dZUHdAi3uRtZjOY0fyXtH/HdopPqhVY7So9nG319ck+QUNKGynwEAbNbi
 Tz1OICvyaNAgbyLt0qESwA2ze6MovbLFhLyGbCe+gU+kKekWmm13nfrpBSvdb0ygA1aMWy4n01s
 TpOd2FzUFh9H5Z9xWDh2jpE/GKYWOhZUF3aN1CyinBmSQL6iLUaQwZ+1ytxzB8L3tnmwk/mfn3n
 TT0cl5jPRagJDmrwVVw==
X-Proofpoint-ORIG-GUID: eHGieFyxNqoLsD087zQOjKEOn1PPDsUk
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a9de12 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8 a=a1qNmnCxCMJs4MpL8WAA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: eHGieFyxNqoLsD087zQOjKEOn1PPDsUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_114835_463792_5F75302C 
X-CRM114-Status: GOOD (  13.00  )
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

On Tue, Mar 03, 2026 at 03:53:40PM +0000, Russell King (Oracle) wrote:
> qcom-sgmii-eth now accepts the phy_set_mode*() calls to configure the
> SerDes, taking a PHY interface mode rather than a speed. This allows
> the elimination of the interface mode to speed conversion in
> ethqos_mac_finish_serdes().
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

