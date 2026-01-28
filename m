Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67430D35697
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhu5VGoYuY+2APKnCn4qVYkCFA/S4HA43b3PtaHWhkw=; b=AbXTn52qp1QtFpzXRso8t0ljiZ
	aLOzpz9gHYSvPoHz4zT57LW1gjs20ePrp4dUPDfPcpbUOSYokJheh1Ua0RdqA9wum66z8B/bcP0Xs
	8+nbB4va7DaiIoVUFkbkovswgzJhk7vsc4b5J6hFMuUxPMn2VE1tg8ecOnmDUBk+ZndH6h2ry4X1f
	geios0CG3LhC7n3UAFnuu45VUuok4+oCzmiOB5Z0w1I7ToHHD9eDtSk9f7bNNuZORgJgqAkdjaSvb
	z5mqRJcaZTn9I75HsvTb8N0vxck0rJ/HcpWsknfqJX2djnnVF+0LRE7iSA/09RC9zupF9lXN/DPQm
	xk742tFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1e3-0000000FjGw-10NE;
	Wed, 28 Jan 2026 09:15:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1dz-0000000FjGI-29hV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:15:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92Dca3387386
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 09:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhu5VGoYuY+2APKnCn4qVYkCFA/S4HA43b3PtaHWhkw=; b=IOQmCH/ufW4viTrX
	TaPxc6VZycFh8Rzoq5DgV4SGdIiSG0d75PmMyeNdZ980/H9M9Q0AorKl4QNSuDLm
	tZPLeF/asFbIJ/dLycpc4Yz8gxvmijVeoyQwHmTlQP9uo7ZaBc4a/w3fiYNJu3kg
	b8RMXx5UIr0hyRyGROHMa7Gz/LOJN4IJdLd1LzEKxjHXiWKjvbBLlpENOQq6GDgv
	MisyeA1ZYmBcRmqjwGAjgcYnf8LW/LAbKQzz6Gg5noeGM2lII7Iw5S37oNsX5OxW
	ZvU8H9UeSORzX0//N7Sp9beU7sNyPEEDAOaJ7rvXFqFK1UlJXPvy5hqsNEsCLTFU
	j5ycQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1dfttjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 09:15:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5e166fb75so1704916485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769591721; x=1770196521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhu5VGoYuY+2APKnCn4qVYkCFA/S4HA43b3PtaHWhkw=;
        b=LDHWln0hoMCFyXqAjtx1mhHeC90uoV0LezVgCQ/ln72hlJMNOqQID8bLa1yQfw96Lw
         qsBFQSzheEKKxEdrEzcrd29fQCgeOxq0ZHCpZVzbGbSJcalZDKDX/u2DtpURARhhS6nk
         8wX3y9PDAblrtapNGmpdR1PaeConVAlDRbXy+mj+sVeo7CfnLltIoHC8fyCRmbHersXz
         Zn2pGE8Xkb/9ePpUIybXFTMHPa6UIL7kCzaB3858uo6YzLf13TpueFjyjeYA5R0vvFyG
         RapkGH17xXgzTQlDj9N7SfABLNFnzpIuw0hzydHa9uoXnWW60QMxTFyEVNgGa7Uj3So0
         JRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591721; x=1770196521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhu5VGoYuY+2APKnCn4qVYkCFA/S4HA43b3PtaHWhkw=;
        b=cMBA5m0H7usGqRElQcrqoJakBhFoF3+KQMY2sRcLkzkj9vq8v/+oohptY7wdpOAPZx
         zJ8FyXSHQs8+6cWuCI7KgCHZmIY6l0cvhzQge8hzogXQYmczHMkjZtsF0yB/L/KkuhCh
         +VUj9R5UMEeblq8/3qOv1RLXEB64qxtH+PkrBuekIE3o2Ja0EbqwIMVLIF70Gh/ISAem
         n62CbcjWio9XfTGdX6XkJCIYSTejZvEztfwHUGfLyQ5mtbLmL3JmIuSaPYhqf2ZY2n/S
         1I9R+d7V1XHgtCWSNjJhe4Pl4pwDBP6Xa30MpKl6BfttyF7etH8UurJ9ExByi422M/JY
         yLFA==
X-Forwarded-Encrypted: i=1; AJvYcCVIKjtV+18eE/+7P1dRILXz/G29ELWu5lGs2rZeyX4gw1DgY+dy5yo4IcRTayBcAkvIXL+GRjmSnGB5xGcGFNLb@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ0p8aaEUwZPy4eRK0r3OVATXSqBGvlXSHynom8r+ixpqQBmYd
	OaEEg33Oq8XwhcXClA9st3KRK8koIXV1YchxVUfJxcMxqcokO+bFTJPa6W86gQaXOnlyOftNwEO
	xWjhSJAIXml2HTlV9ImYYG4ayJAHgvw2Ahh1qom9lTDVcfYD8VZJmI4xa5myqmD6+wjUVr250R+
	SaBA==
X-Gm-Gg: AZuq6aKm6gCehi9iABDgntPGlqGcfHD2lTqFrgP2Q17SsvBrn3s/2pPXhNsBCk/chWC
	6XK7+vrl1e3Va/+uD4rWDE4/w7t6x0m1UXr8x1KUN+E4wcVpCA8EGAOPIp+Jo3iZXpmRDCvOF1t
	bYdbLHzyHdSwnxwHFSSQYFJ04mXYnQuYFK8ARAWVeicWjnElI5/aeU/XUvaHYRxmEh4y+em/3fP
	tYsiHYtELZU9Sit5GN19NABOmUhxBgv7u2tjsqxbdEDUQCcf87KwoIIzaEpsMVSiOdV+B2vrQhN
	Ef335FreaNAPxEC+mgqqk/hlFW2XYB7IboDOtdzdaaFgnwjpQk/eIFRXDOZzlq6Anq80h0dBjGO
	km4I2koUFAzZMe9kh3f91R62x2R44UZMRnzJMpw==
X-Received: by 2002:a05:620a:2844:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c70b841f60mr586868785a.25.1769591720616;
        Wed, 28 Jan 2026 01:15:20 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c70b841f60mr586866185a.25.1769591720177;
        Wed, 28 Jan 2026 01:15:20 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6cbc:dfde:e62d:3195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c4f3edsm114757505e9.15.2026.01.28.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:15:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Doug Berger <opendmb@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] gpio: brcmstb: Bug fixes and wake-up interrupt improvements
Date: Wed, 28 Jan 2026 10:15:17 +0100
Message-ID: <176959169745.11014.2711672747307592197.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127214656.447333-1-florian.fainelli@broadcom.com>
References: <20260127214656.447333-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NSBTYWx0ZWRfXxy0Ww7YRmmf4
 dbW6BWle4fWZT7iZHQoxHTVgwBGHoLT4UnhSNs2LM08Jzd4fFjoE3XQ/pvjXs3QshxQcODcjA+8
 Xhzl9HmiDhWMG1cZajtjWH4PHhiNTS6ZT26xAXsT3SSU+ajDKVQ9QzmfoyhkVOsTG52FMWkS5Rx
 pF2+0FjpG7Oi9JO7d/esoEw3wqkGZOs9FnGobue1S25lrCBiXh5U9X0t7O8bmEPI2Me96dR9O63
 XBno6txx3De3CyYYC4Ioe+OTESlYNiyrOSBHKTFRQ9HnMy3Q5LBG7mRVCOT0dtRvpH5RFHChFk4
 LMx1UHpG2VqLvYtluA+cyGMeNu8GtU+R+lZUeDNwnLL8ER9l/CSH0DTo2723aCiO7WCmKb3KFsM
 +fn//5ulWuCo8S3jqIp7XJhM0oFUbHyNXpDrse1BOKtbcyfJ9zZPUUYwS2gRQBpWMSCU7rMdoN/
 en9xYWnsK+e0ubAPmwQ==
X-Proofpoint-GUID: KsNrXnu4pVojwMzomYpBdA68lzSW0j0K
X-Proofpoint-ORIG-GUID: KsNrXnu4pVojwMzomYpBdA68lzSW0j0K
X-Authority-Analysis: v=2.4 cv=YeuwJgRf c=1 sm=1 tr=0 ts=6979d3a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=05lQHlDK7r49ThUfEH8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_011523_673946_E6E738AF 
X-CRM114-Status: GOOD (  13.74  )
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


On Tue, 27 Jan 2026 13:46:53 -0800, Florian Fainelli wrote:
> This patch series corrects the HW interrupt to the bank mapping logic to
> be more robust and do not assume any particular order.
> 
> The last two patches improve the handling of early wake-up conditions
> and makes it more robust so we can use those during "s2idle".
> 
> Changes in v2:
> 
> [...]

I queued this up for fixes, the rest can wait until v7.0-rc1.

[1/3] gpio: brcmstb: correct hwirq to bank map
      https://git.kernel.org/brgl/c/b2cf569ed81e7574d4287eaf3b2c38690a934d34

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

