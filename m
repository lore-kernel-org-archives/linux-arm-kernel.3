Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C154C98330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 20:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujKSyEbbhm5nCRZUQ4cnSVXmCMUReNgv+yj8//WkZoU=; b=bletEanr7380L/vwnuuhuVkP9a
	Kdz8gHJTSoZNjk+wqy+xw7+1zrBUrGI9g3/cENQI0FY6jhZ5Fm9vTu3lWFju6afs6PSy5Iy2ozS9C
	0Cn8pwEYtZkZcvY0HNQwtUHcn5q8SjkdQz4ZayWZTYoB/2nDM5pkwIvpHbUDKPVAarQEdKRFN+p6S
	qTv65C3VyiScbeLCiLMO0V8t6c0W7fz75qmLXLJy879HNapHDm8t3juz7zPoq3sRR3QlweE1YIm/X
	t38y1uHEXNCs2/fNNUcuvUTQbRc8JvckWfzGOEbtl91t7w4XswtKF8WZLMpyvV0YfSbI9hxmhV+av
	achJZwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhCdj-0000000FsxA-0s95;
	Sat, 17 Jan 2026 20:11:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhCdh-0000000Fswg-0GVM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 20:11:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H3jik42739200
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Jan 2026 20:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ujKSyEbbhm5nCRZUQ4cnSVXm
	CMUReNgv+yj8//WkZoU=; b=fVhhSOv5Lx2fhXt2xSaWb4me6DFUQerANOtb6tVe
	+MHge8CJ1m8AJHhSaTaYdIThsosEDc6iNBysdTAs6ETvzVVHwh/e74a6TK2mjpQ3
	ZYZaNG3U3H+howdqAJEuHOJ+fbT4RMToSDRJq7DA8mfz8K1nFX4IW/T6m8zctdJy
	bcrncAKcufXaPapAJj/asNQmTMitEfJoL7PiilPzdYANnZQ0KVpPdbfF6LEdP4JO
	rHNcgqpLRgp1h1JepWOYXWPyCyM1/WGGDQa9Ie0imnGh7t24q8DwqPJjNPTGFkGR
	yXsgLzA0C6i8uhaE6JLCVisNRFRHFEE3tUhAOeEp1xhTWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t71baw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Jan 2026 20:11:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5311864d9so678440985a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Jan 2026 12:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768680675; x=1769285475; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujKSyEbbhm5nCRZUQ4cnSVXmCMUReNgv+yj8//WkZoU=;
        b=KbFWSxVjOdL+ZrZc1kExqBNYEc0DB3b0Dbwm4017dgneX3I0oOIQlW4sI/cwgcbtT+
         1PfsEbjykG7IJ7VJ3wOjK8HT37aSMCWjVlI1bfOl6of9Ddu7sad4m4QJcPWskGncL+pL
         BiFaUvSq2T5aGMX8QDnOX8cgZ2fLcdnnA6IxKBT6jOoJl6AafT8oi+FFANXDOz0D+smD
         1Q+78EyVnDuP8gxBGq5R21lW13Pmr0EYxj6qnDxc90PWsRF4E4DGlP4x/oohata8ww6I
         1IEfAweJjCbAtulxcF8IX8+GC5m/NcYfwzsLiiWFD6OhHBHj9e04mQWPw/FLCLkbwTNO
         igFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768680675; x=1769285475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujKSyEbbhm5nCRZUQ4cnSVXmCMUReNgv+yj8//WkZoU=;
        b=l0yEkKAGj9CPgu2slb2w8lBa94GrndIlJLA9aEPHFTa6aYL7z2oq8aw5GQuOnfy/ow
         f91S03tZC7F1FbKA/ymDTc+Ns9LOjBQVJIgQbdR9INZDbqEizMnmXv+2XqfdE6fY8hed
         /ceMdMPr/YqZhfImCeqOiwc6tPloHSReryAuRxdXhhQVBF0UJuQEDQ4f/FeET2NEPq2B
         AOdrgXt5EApb+htKnXXtoP+HG763FrUm7m8KmjuMDZF8Cn8ScbdpXxQpUZyhkvrEJ6r4
         1kTaZ6AfhoXUGGhixG1FMbeBKYYtVhjWQSuUdigFJLEe3mT1+oc+IJFVcLRxyhKi6mF6
         EBuA==
X-Forwarded-Encrypted: i=1; AJvYcCV1A782Ln0UxzZA67BB0hvnVTd6dDZkpzCZTlNxrHIDj8nrlelvvjToWRSlX5oLsuhS8sarKFOjR3x0tGDXDyq7@lists.infradead.org
X-Gm-Message-State: AOJu0YxiQ+ccsh2X9XL58WvxN6iFAf7i37i2D2Zjr3MtUhVlbF38lygt
	UAgSW98YhN+j9Ncsmm1ifAQqHrBLHBg9x9Q4h11m5q50K2iecPM+kdwEagjgb7K4/4M7wCllsep
	rKbqZmRIK7goNHfkenW8XPmm1eFLY2/ArTJ71tTgwDDCvBw7aEQLrWiwDjy99jqchv7kddlaiGd
	x/8w==
X-Gm-Gg: AY/fxX48uOffiYE/Wl4QPJ1uMFfvLuNkZiFLwoWvTmYLlTzeWaVqL1IseXBrr+1FqhS
	k1R7oM4+nyP+v46vS0JKHhuf/R7hWh2ICtORj9omtnt0xJjn1uBXsG3BfalV7quCzJcR4Nk16Pr
	lBwJGvd362EJpDiNZr6DPJdMEFmrTYSCcTB+Bt0qvs9tPJTyWl5+1g9q1aE5OEjwIYUmNmAYI1u
	NU8VgkqdjCX6CkKcHHUC/79Pyu6cHWOZPTVFETpp7oEEMm4ttfAG8jztSS6CoPYlsZAAG131pZ9
	eKlgeZsRTyEpqIvd/2y/qdbV2HY8WbXJBwbCEkwLUlAg90wqc+TfOrPr7e/ZAueJQ9T8M31vo/K
	8oudY37zI+GGJd/Sx3uUHqn7h
X-Received: by 2002:a05:620a:290f:b0:8a1:b5ab:bbd6 with SMTP id af79cd13be357-8c6a678d1c5mr1037441285a.71.1768680675406;
        Sat, 17 Jan 2026 12:11:15 -0800 (PST)
X-Received: by 2002:a05:620a:290f:b0:8a1:b5ab:bbd6 with SMTP id af79cd13be357-8c6a678d1c5mr1037438085a.71.1768680674879;
        Sat, 17 Jan 2026 12:11:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f42907141sm164657495e9.9.2026.01.17.12.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:11:14 -0800 (PST)
Date: Sat, 17 Jan 2026 22:11:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v3 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
Message-ID: <3wfaqupyiynig5fx6uuo3jhole6f4hxwmaetcmq4sk4j3w5a7r@qxyrms524sl7>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696bece4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xkLUNt4dAAAA:8 a=EUspDBNiAAAA:8
 a=aW4Cx1oNOFiDtan71kAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=A2EApc-QTtVVSfvlwUcc:22
X-Proofpoint-ORIG-GUID: Nu_ifExWD7zsr3DyDXL7oAfUvtDIakFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDE3MSBTYWx0ZWRfX7Hf1MM9sPt4Q
 7YhCpKMvBOExHFpRZcZrm0IJU5Ur16K/iqrmlixQj8l77tVfEbWXDQlP3g+G+rFTT3jQHH2WhqK
 xz/M5+/Rp7k6JIRv4TxU3ysk5CYJDkZlz9Ho7F5yyvDpA1ixKBvJoLOJq6YlVXYfGHxTT5VV9na
 r6BsPU1tCa5EDFfy7WtgUuMro/cRIe1tm2AmNdvjuuZZrgzl/ZaCxzBWdIfhMeFYVDtH7xVSf2G
 K9+kmhZZOsDeilRVRinl/kOCHMi+655pjHwBnfJ4uzdwxD3vd6CKrrhGtWXApGzfofej8TNpSCZ
 9IKJRtylPRfVOIb/XaZgKXSBmCHMikHp8FtaIn2X4LMstmD0unLyXXq0t9zIP7e+nuX+Yxfz+8N
 giA6EeZ0aHGJ18Pb44SqjuO/nITHKocLpxeJBc1/C1Q6i6k8D5VEoPrKinN4HgA2eZonHMTaShF
 5gt12RBzjH2Gu6vTotA==
X-Proofpoint-GUID: Nu_ifExWD7zsr3DyDXL7oAfUvtDIakFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_121117_223930_635FDB02 
X-CRM114-Status: GOOD (  10.53  )
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

On 26-01-13 15:52:41, Marco Felsch wrote:
> Some parallel panels have a pixelclk of 33.260 MHz. Add support for
> 332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

