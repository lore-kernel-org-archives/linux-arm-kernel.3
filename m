Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA95C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=; b=KWrU1p0B0yvDw/bJQnlZDFQZcF
	A58SE4OMAGbxxucVw8L7OFP5pTuE8QuKQCCWIBoc/OujD6BUKruYXIadLHuoseOLYYcxZneZ5ZCcm
	Ld+3vBdxaZfCS6MwnojzMrJPAzicwse53ewn1YRA7yZtWUAfgfhkJuOTPcZrHQqIsYQHI3unQtMBh
	qJhrvlWOSqvxdTW09snCIeG7vDMHVF54+PaDZK6GnBNr6DA9nL/GZTCM9iSxYGwGhWKFBoCpTRSXw
	6IJNeqyd+8ohJLUPb8HGksXq5nF3brur9l+Wtlc/wMbln3b7fjaLY5Wl/fppUnfth1cUPS7m9Ocke
	hX/jIrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhX9C-00000000exX-0pKX;
	Sun, 18 Jan 2026 18:05:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhX98-00000000ewR-1zL5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:05:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IEhKWe606261
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=; b=W1+qbaBRmXE9Cktv
	oIMVm0EvrSx1OwTy9S8AmbkQ8ZCbNC2JsvV4fRY5HcqHoGmS5JsGL047uY9gotDT
	Ws2kTx1wLW4IV4GwhOIAcUT3bpfWR5GO455GjDAbu+CsALXt+rytZr43sFJxFJjT
	B2Cs7nJ2Udp3h0GbEsW/vziOAlDunoK4FaWzs0dn8VYfWkrJ7fIZLSykV9cibHs4
	arMrFhBl58HtxRTeTqCgy2No/kV5PmgMVLj1LP1QVrL5Y2ucWuslpGP9V28ThWZT
	71s3nBYv4+tc+L5fp/wYwWV7Vd0GabVAdNMVBrnvRQxZRxz6xASeZb8qO3Z4imqo
	GU6zuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3kh2m62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:05:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c538971a16so823454185a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759505; x=1769364305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=;
        b=HqSwSxcdx9UNSIvI8X3dalwf83XOPlUmnRtvhmYpdMDTV0QsbUhmgCyHmF2O3C7wcp
         KMHtWY+iu5FeSkH7M8w+sLedbkdz4Fv8Gy8dpGJwZF5TZWIkMV2s7P2vmKmfbNicVFAC
         LF33Ily94YyYF/yRNH0WzQUNztoK8mCUQ0qVL2IfDrUJsYTmyh2nzckkB2tuEcZXfT18
         xszhrrL262G+b9rkYkjxnRJQJ41loVDe3J4HSXoH6/4ps2qDnY9bUVGnNN15CUbhnsOT
         jpjD5YLHTuQCnt8mIL4fcdw4XyWaJd3tLaNtnFucyq7RN7UmJRMIu+42585I09SjOb2m
         fkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759505; x=1769364305;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=;
        b=ryNbPifDjWvj6HAkPAOuvbK8GE2YpVFA8Q8eNGwOX7cmoAL9jQHhXhDjUjDe65DPSh
         g4trmcP7zQ7xccY60+2/TGUFvWkIsigk/DHOuHh+th6cXHX+doUU+oVOkUAz3DWFME3b
         TYQYg8kZJJzgP7HaNsaAjD3Dl/wbGZvfmuLqrzVMbA2o1WzpEisVk87BSt2vYEfKBE4d
         /AFe3siVSD7eGSk+XfHw7VyPWVda7KxqMlL7FXIkWBSxNyD1QdBqG79gwOrwqQdpxQzs
         I8INptNTjAfb+qWKvlvpVe/1IubbM9ZTdoUAQAkJE8/GYXsUDmR1FB66FCuUnYHa+uvA
         DYRg==
X-Forwarded-Encrypted: i=1; AJvYcCXZhxBansMFeg/WiyCoXC3b0GYp+HkgCVsbQFpNJTIUchOiNkxI/yrz0FI3d/RkBhOEn+ejPGjFrBaPOVVS7fVK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4vJ6tgNuxm7cXfX9A1j6OZqNT9pnhPZfd2v7cfCOrPwXf8EKY
	Lw3CJPHst7E8pU3imrxdwygKJH6juTQTPd6dYpPNlO4kYNkc53laqY0JdyBhoyGbnAGox3fE5kT
	SHmWfY6iTGK441/2ekNs0HGkJy5S9nq5x3bUAM0P4uVDBEEpaNt5ZZpkp/ESxrOgakFLE1X7yDE
	GVfA==
X-Gm-Gg: AY/fxX5JyegUmKj9QilwfMgwPet9wVAx52gv8qkHN7Flu+2MXjZWUFNEHOVNgziMYfO
	jzc1JmM2gyegqqIZmIVJ1ebMibiz5Hoz5SOUl+kIku3/9FEbgUsgGzMv0YyERbrd523uyatbI23
	pO8jlLYIPXOnXu+LsLugavUCFfZaRTct0NOsoa8dgbO5y0uWDSuhOUuf80cVadIn+7kqy6rNaRe
	xZ9ni1Z4PoSE10EYcYlwIfHC12JxoD8Lk7UCikq6EdRx36kectbRpBo1hzTAB2b8QMly7D4oXnf
	2trRc31mj35jfu77rwKMCz8OtxjTPtUcO/F1syTFEQmrg6QtXM7l3+vQV5VISnMVbzUweLSDNT8
	PtivNZO9/purYV/VnIA==
X-Received: by 2002:a05:620a:1a92:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c6a6789994mr1324354485a.61.1768759504598;
        Sun, 18 Jan 2026 10:05:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a92:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c6a6789994mr1324348485a.61.1768759503901;
        Sun, 18 Jan 2026 10:05:03 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm895290366b.38.2026.01.18.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:05:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
Subject: Re: [PATCH v3 0/2] Add more PLL frequencies to i.MX FRACN GPLL
Message-Id: <176875950215.776971.6809475873129036487.b4-ty@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 20:05:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OCBTYWx0ZWRfX21yDvoymAqlA
 j0RimJxWhWt+a9G7h8+hUstZXKn+qg481paA39maajPPb/Rz30hsj2giKlWopkePX/1niCxmxdB
 hPY5L6qvEsb/dSf0wDbLXcM+Y/hYeT6IVTvetCpr9W1iJ+KmChxPLZr5b1jE7spHzICC++ZE2sP
 dDs1/IuA0PTwdeFns+/NBTgGxZRtRhlgFPwkK6URbeudFXscnZUD31fMVKb5GgT3QLms/tLWZXn
 nV3IstEubm+MhjAShHwsG6aM/uuDfjJ+Ij4KQCPF9vy0xqf6+AHBY4zIiLg8JSGVr/ZOTfJKVQ/
 h9j+vPJXCBSV5yQTY0zDawOJynKfNDg4umONjrI9zkRVcc/3rxYjPPEVgoB/1lhYd2mQjoM/m9O
 edwvkZcohmhMLd7uCTFJvaLrybWJsEE5NAiwcWCon5v+BZ7KFX1TEzMzgbx3pghZMuj5tOh7VdD
 CkNqCuR3k2yS2axnS3w==
X-Proofpoint-ORIG-GUID: cmxqNvLRERAQVWTfFOSL270fvDq-Z9_e
X-Authority-Analysis: v=2.4 cv=JcyxbEKV c=1 sm=1 tr=0 ts=696d20d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jAkwa8wCkOQO9wpXspwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cmxqNvLRERAQVWTfFOSL270fvDq-Z9_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_100506_541441_CE9B26E2 
X-CRM114-Status: GOOD (  11.40  )
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


On Tue, 13 Jan 2026 15:52:40 +0100, Marco Felsch wrote:
> this adds two new PLL frequencies for the i.MX FRACN GPLL.
> 
> Patch-1 was previously part of [1]. The new version of [1] will drop the
> the patch which is now part of this patchset.
> 
> [1] https://lore.kernel.org/all/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de/
> 
> [...]

Applied, thanks!

[1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
      commit: 9bb910b049402b7a3496250c9c6ab169aed83d15
[2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
      commit: 3e6b0227b93c708e93e33f6c3485bad077650766

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>


