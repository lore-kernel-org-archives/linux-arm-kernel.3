Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757C4CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ0RRpoiTcyO43kD7baXaPj3wcmkJLLGJPD4QWeYn7c=; b=EeAcSC9nVUkGtBr2ufEOQKijxS
	+BGuJdi1FQ68Vn1bBjKIiB0yRqLwmVn1eYS0PtutyKXhJNKialj6UpiNE4qjkJyYphHlZ5V+J202S
	76XRc3ED7AYnwExDuSnW9Nfu1gRtw8HMFbAMTNhgZIm71ghxYtPceSmd+uH1vgoLmUEr4GLe8Zl6S
	Y3XjatyNSpIc82P1SUpJbiacE/4LMQ480Ldhp6dUQ7JEQTVONInaqRgSamz8HR17PPDLl4gTFE6BU
	4E13EAmr6sIF667v0HEBHnSVY63mWB0lWECtWwzQHIOK3uVrZ9h9yniYfOjBO4JVaNrLEuVUDnTET
	4iM/syZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzGZ-000000062HZ-2uTr;
	Tue, 09 Jun 2026 16:25:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzGU-000000062GC-4C8w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 16:25:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GODs62748479
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 16:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZ0RRpoiTcyO43kD7baXaPj3wcmkJLLGJPD4QWeYn7c=; b=TAWczO2aidQaIoXM
	CC2ktMv8IynppxZsasLjjfJ52g3otyjQyn/MsteSYkqsWxvFBXVnBolc+LeiPa4g
	OZLGof7YuybsJVv8LAqENi9JSGzTdn0d+eDbOCuDOZPN0yMtyJ0S+1SEySIjJxBM
	lstghTt3DsUuQfhoaijNrGd/X5SQjQ3TgGA/wzwYX1J9zaWDoBafp3gHiyjH+Ufw
	jxmkuF3jXWwr5BMmU41FH/oHi7d0Oq5LLIYWvEDmKOisU2IWMHYd5/M0ZLjaPxcE
	lncCTIWfn2KQq0U80eAQNVczYw2UFVSmYdK1fwqdklgHGtswSh3FgTaR+d9NbjAL
	IQ3mVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeetugt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 16:25:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b9106b0fbso4646731a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781022322; x=1781627122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZ0RRpoiTcyO43kD7baXaPj3wcmkJLLGJPD4QWeYn7c=;
        b=TJduPaT7KkwagDjY8Z++AmufCmpMsU0JGIIPziAPS49eK0oOG0AiJv+RTPkDW/9pwZ
         t5u5/X6JSkSqclx4Tu8cUpRkKPuNx7Xhoy8BVgCY4OZGzhosy6PABKD/Hp170xPkT3JZ
         Egae16psrc6m9Vln5JMRn6B9ywCgDSYivk2H12yskZRYCQTgNAw0IKVGqn+ZdoMisiMQ
         ei+d3MVrkQ6kd7j6AkC1w90sa7wif9LKa799J+mMIeJGpn6cvoOG0K3cSIW7z67YDLim
         THsG8qVLUrP0baxjb1SVFCSjIUxP6L25WiCQ1gq73Ta3uLS4+omsyP91V6uyJQOhO46F
         zDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022322; x=1781627122;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZ0RRpoiTcyO43kD7baXaPj3wcmkJLLGJPD4QWeYn7c=;
        b=jQM6k1TJ8v3eIeGI3i54aDtuPOOEkXoG07N8f71IZYXa1qgFisYlv2KrdPkJYMwltf
         /q8K3no1hYBt7No0kFXddDFf1ArSDYqXMVMiDvTEtSwgh+XNljEGfY8fVTJjAKPLXn5+
         uKQl5rBcvuvCiZx6+dGAPq3fGYJ0Pt1YmfQyGf3Er59zdxRtg8AJ1aigIkXtlN9rzyxf
         u1j4W9REXWW5SUWCFyZu0hqx/wku/YkSi7lxUBk77FupMgEWQfV48pSEk1FnWTmZPoUa
         sCZr2FZWPYqfcbVQrVjZCkdSHtZruDYva2gaTPF+5WJ49X308/U/tKRgC21GorLapjFZ
         VONw==
X-Forwarded-Encrypted: i=1; AFNElJ/r5gbkpEiwe3ayRP2RMCUUjPhQ9z6z39n/t3b9YRaLDIat1H9miSyLLrcuDnX1Qzk8xpUuUyKIFFCM5EY3BCCY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzq0iRfIQ6/9xYoO3VPwaMu00NLkMMbSsesn++7dDV1w/esgPP
	5tnK4MnCHbRVy92Eg0O0B60yvz9S7Im6GxDz5eSqD3AQvTsLRIoUBr2yNhaM+SaIr9bExYwaWMI
	Y5JDyMM3ZvY20Qvpuawct8OjZ+BC+ahxDsxkqylpzZCgSN8qaIf0NK8XlIZUptWxcHkM65RjS6E
	84RA==
X-Gm-Gg: Acq92OGy5xM51ZXrkyxf9U0djcENBqBhq16cgpw4m75wswWf8Qv8UGv1cxiuXK2ag0J
	1xxbvsZ56ATbJpG+T5t5vOUKTSyPqfeJ7hs3f+8Ot+ixZpSrTi+8APUT6CDrEki24gD5vimY/PY
	N2A1YcHcOijabsFVRN+BXYRB/kmQNA6wylZXnkDSi+FEir92CCPmwzjkC7bQNsDuK/iR8wBsL0I
	BvPXiEOQ82esjczOPl59hlsBgptQgQJTr9TL24XrC0AC/xZoXR5/UHlgny88Oqf9INF0o6zBQfi
	daCvdtUnREZOOq6d18l8C/Yr3bvQNX+hp0JzH3LINIBdjkIzHHHMMOkLW2J+ISXnmiBxS4a0cla
	Y1g1hh0WYRYQk+L+kKb/aHVDJ72vYeys=
X-Received: by 2002:a17:90b:3903:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-371328ae3c0mr17914260a91.13.1781022321818;
        Tue, 09 Jun 2026 09:25:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3903:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-371328ae3c0mr17914221a91.13.1781022321282;
        Tue, 09 Jun 2026 09:25:21 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm24900815a91.1.2026.06.09.09.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:25:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Yue Wang <yue.wang@Amlogic.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shuvam Pandey <shuvampandey1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <177909148011.9588.6639767953842842291@gmail.com>
References: <177909148011.9588.6639767953842842291@gmail.com>
Subject: Re: [PATCH] PCI: meson: Propagate devm_add_action_or_reset()
 failure
Message-Id: <178102231651.11622.14383228802721431855.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 21:55:16 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a283e72 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=YIal6LhKh1zn__LXBV8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NSBTYWx0ZWRfX73Yx25KBhwfo
 5dAawQ6nXtThfxGZxI4zH5bdHys3unaJzgd/smgZYyL9vHloe8goA6jFF+8bAlQXJVdkX96ZedS
 DQ+/sNE5cxlBnjvGTTkMVmE6JPRlza+4Q7FBa8Bfz3H5Bv6g9ZFoebWVwZ6GNdi0iWGwJkD77wC
 NX1/NZO2ij1XmCvivQl4IfKRzcwIbjSoZSRR7yTt0OcdmcBNhkcCf2W+mURSei5UFJD+3Nvyax9
 570z0WjXnazipFUwawzCE1SuA8D58aDrBvN+5IUEprC1IcMBLYUJdXaTRA2uOnm3Tb3r39iW3uv
 Vl2a47+cUeRWdpehFKNB2z4NtD84IO6NBTPuzGqtgUwUqqTeEowrKjutlbQVwf3tw9Slu3acfYb
 WVo2SW+Kh4PaguYjIeslHu872r1YAoyPOW1GnAKnmMS5ZstydhKiJedzkkWln8ThW/TZ/7FHdoE
 xfR2ls84jS+v6/fo31g==
X-Proofpoint-ORIG-GUID: 2u1gVlRErQgEUt428N2POJEyjt8MGnQc
X-Proofpoint-GUID: 2u1gVlRErQgEUt428N2POJEyjt8MGnQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_092523_054588_644B9C03 
X-CRM114-Status: GOOD (  10.85  )
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


On Mon, 18 May 2026 13:49:40 +0545, Shuvam Pandey wrote:
> meson_pcie_probe_clock() enables a clock and then registers a devres
> action to disable it during teardown. If devm_add_action_or_reset()
> fails, it runs the action immediately, disabling the clock.
> 
> The return value is currently ignored, so on that failure path
> meson_pcie_probe_clock() returns the disabled clock and probe continues.
> Return the error so the existing probe error path unwinds normally.
> 
> [...]

Applied, thanks!

[1/1] PCI: meson: Propagate devm_add_action_or_reset() failure
      commit: b12341b98d5ac52f48ca1390e1e371aed81346c8

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


