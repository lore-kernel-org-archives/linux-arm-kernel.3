Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A3FC79FBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 14:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaHsD/0AD7lBzKkvh6XVMrU+9amfBPvv7vVc2iCwtKs=; b=2fjsnGqFnHKxIeOZBaJgbney+S
	PYr/Q7atd4V30JynmOfZkZJMG4zGbbqLY24dkimxhxDTBOMwDVycUUmsd3MAV0dZOQtNTmr9HW+HV
	s9NSW2K0stbJ9orrDaU42sVMHdqKZF8xyXTKlpDqJlk54OM0p4w3ZPrq/kCiTLGyDT2C/zclzdWY6
	mfn8t+Iv0sO4UqNq0gfsNWEF6r7r4hdGKWU+chK9KWiDL/R3N8UD642fqYGhCRlcMYW9z2qu8Y/Xh
	FWHEzfbrFh+Sc3HpRU7GiltGF0rAy5wi+1JkD4htUNT7cm2HHJTUiW+a4H3gLbjHy8rvK7TOLxPXP
	bMTC0dJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkte-0000000EGSl-32LP;
	Fri, 16 Jan 2026 14:33:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgktY-0000000EGPc-0XaG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 14:33:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G80l5F3582472
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 14:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZaHsD/0AD7lBzKkvh6XVMrU+9amfBPvv7vVc2iCwtKs=; b=UC5E7DrkZ1z5Uv+7
	FycRnXLQwY+1rTM48xRK/1J9gd975UbMQ7qofeEm5VskxtcczMF7hiwiuMVqgkeY
	8b/wVYSI+64va092l0RCPEsFiALYYQdESd4Y9DPP7MUioGHQ/2dYHI94XMdNpQJH
	/TZIUpqhnUIV0zDoZEqhfDoFclr5MM8EGfxx5I+7lTk2ykOip31lmlz6tCT+cc8Z
	dHSNqnS5rFpw60M0v4gbAfWrQN4EwMJdRMRX0TAia5dJJ1cC/zZcrgv26y6UMYjj
	4mJfQAVG0Vq34USJCP3DRvs9BhQvn+lakWgQa8MZTpQsgu8vF8E+MKM3CyVpPHLQ
	/BbdXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9aytebf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 14:33:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ba026720eeso600783785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 06:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768574025; x=1769178825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaHsD/0AD7lBzKkvh6XVMrU+9amfBPvv7vVc2iCwtKs=;
        b=UY1z3EQL5AoYEH7cnB/1sSG4N892pQemBXaQ6SLEbnZUs8g9RkoCC9O2VSiLbuy4fn
         Aj8OM2U7f37ndcUh3/AX5ULTlx28tcvHV13/AB9oKFPCCzgG8JSE+0uwbmG1Ha76pKf0
         8TPKDQ9vQ0HpnSwzBiV5TbISWqMTvnMq+96VDe3YNVn1dJJ+skAuBAR5tGPo41uRECXo
         ywt9emQBoFGpOP90r064iL6dD9YRRhxCZ6/9wswIv44lnmEaRsL5+/mixGeMj067x01X
         Mcf3XUPcdX0rAogEaXxQ4T05CwUT2NrEBJ1S3IOx17D4sOIQEH+442/vmAjKazkgJXdP
         J7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768574025; x=1769178825;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaHsD/0AD7lBzKkvh6XVMrU+9amfBPvv7vVc2iCwtKs=;
        b=QGQIfgrHjlxjqCdgzCj7AGlQZ28nTVGt1/1i7m1Iw3cBI20cEKO5fR5g/hj/Ee4H4O
         YuQdvQaMBwzMShRhcH/3YNyl5VpS5WGZYlcS/tnWcg7QIjDg3K68DF6Azx4d1p7bj+TP
         Ljs8w+ki7ufNueUWE3E3ltaHCgnKer0+T0aCV2pTD7uXtzAgwgyutF95u2dMkRDcLfur
         fwuGfLFldkNLIhY0U/0VAXdPTxik4MShsrtShTsnoMdBa+rZ7A8nZlXfl4LWjtAPU4Yu
         YlE87QfillC1Ae+CVc+D9Nzb/dOH65dh2taTgP7Icnb58DYl9+eIHEyaDYZCAOBG5fLC
         CWfg==
X-Forwarded-Encrypted: i=1; AJvYcCVn1hWn3oFtEnK+wfhzjdbLun7zn+jus69/Xc0YyysDrgdO0DdQz7nFB+29NAfY/tGOnynvsiExK32F9MhDLWf4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+i1988UteuiwXB/H4NyMoUY/GMSqphmcZiNvOwYu2tQfpBBNE
	O6C3efRHjfuFB0qNlD/ytSJtE+IfTzZrqLxuieYKLlVurtRMax1nEyEOAZKBj3nGjTI4oOX/osZ
	pySGJKJUoc7te2QT2YwS/CZyhWt8jTqc2bHQrv37udFm6/b1FbVx1HLd1E4lfP1CNAx+BOAZG/8
	l+Vw==
X-Gm-Gg: AY/fxX7GgoTtpVLn0d+trTtib0NCwPsGq4xujv/kUQm1eq5KxDD0wgBMuEtwh8RLVon
	1n7HUtONGW289hRblH1SRSt67OhtgmLTn4kx5IVRuUa2oXGZH9KiYeA36GrTB6xeG8hnoc3fyvc
	OJrWr/fkZ68LTEJjlHYtmtySx80cApIXz2Zzfix9qQQ8pSrN9ekIAucTZQ5qVEdoNxyRJ+J+oJU
	LfJcRjsVoGIUkyDmB1VNE0TOm9KL55zBNU4weZQvP6+CYlCsd4Alf8qNoDnfQP/EM/QlrqzSB2Q
	Q66ADsWc0j9LRSxMW7ABNrwT61DS54HZl3Q4Kino6wFxPvZYBGdGXOrSKjXNVnPZ1753I3ko8tl
	sEeTl27kLs3eASfFFfkclBhh1AJFovZcyh7F49g==
X-Received: by 2002:a05:620a:28c5:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8c6a66f1e53mr472487085a.26.1768574025484;
        Fri, 16 Jan 2026 06:33:45 -0800 (PST)
X-Received: by 2002:a05:620a:28c5:b0:8c5:3045:3e7b with SMTP id af79cd13be357-8c6a66f1e53mr472482485a.26.1768574025035;
        Fri, 16 Jan 2026 06:33:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm5623880f8f.9.2026.01.16.06.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 06:33:44 -0800 (PST)
Message-ID: <49ebb3b2-128c-4fe8-abea-51a3d47cce73@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
To: michael.riesch@collabora.com, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Collabora Kernel Team <kernel@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _PjUECXvQyl_IbfPtOyw519-3qNZiiO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwMiBTYWx0ZWRfX2klNLeRvj5oV
 GChm5xnj573nYaHMjZFhp6SqNedwPh9YY788/340zABvZlCZ1GNihI5Irrk3jSyA1BcYngFQhSM
 C5vIBtq8bWC4xgJvkMvYmInJwbJ1dT/YpjGTIO3kpJEMQ9DqhHGpkLBSC3snsGmRfMyIxFQI8uG
 br72nGkCrclskYyP+phy7nRte8BCk5aWk932s3FPIV4du+EZggCj7ayVyNHd2FUD2J0SoQOHwrV
 0vda1ij1goByNEPqrCyFFktJ3win9IUJU/GGPQgHQPzl1PchdImI38ccKPUi3+OyDM19R3Mt45v
 6d+j35Nvg/24nthLrPXJKTVHA4Aa3voXKcwGL+MV/5nkJYGhpK04IJJPyUZPxrmRu4xNv50YPKv
 yNzO8pAgY2IEF0Ez7RxMu4T55Z41grIdp0i5r9M0hcV34Zd49teljJzDhw3TTOsMJj0rFiSaBmf
 u3ZLUoG785Ozm+ssIpw==
X-Proofpoint-GUID: _PjUECXvQyl_IbfPtOyw519-3qNZiiO7
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=696a4c4a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=etG1dv-_i460GIfEFeoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_05,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_063348_277104_1991C3DF 
X-CRM114-Status: GOOD (  11.98  )
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

On 16/01/2026 14:54, Michael Riesch via B4 Relay wrote:
> Habidere,
> 
> This series adds support for the Rockchip MIPI CSI-2 Receiver that is
> integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.
> 

Please slow down and post it once per 24h or 2-3 days. Not every 50
minutes. Allow people to actually review your code.

Best regards,
Krzysztof

