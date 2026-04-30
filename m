Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AB3CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcNk7RepMt/ujrNFBx69IMbbsGm9Q1Adr/Bz78TzItI=; b=Z8OtvWx10sNE6RG5qnHe7VkoUq
	Avf97x7JR0D01ZM8U+K6x5VW2Y9TTc1YO0QATVZ7Gl8TZD9f58eC0flLyzfyEZJ5JstiBshUhwdmD
	ubJq8UzD3z9TmchUEDo5nzJnfFgvSTauXSmUyDSCd3zoRtMQf8PycBsGKnMMxxwFq4FBZ89XluRbN
	4GDVia4ofqtGdjgIVVIL/OGfDiqsjBBCFZU7VaFoA5UbejlheTQJ6fAznt7qkzS610WuuBZj2+7Db
	XYeJtlyT68y5mXP38Ao2vNyewCwesidUEw1Ci1QHmR81qvBqwX3bgtB8SgmQ1KtgkM+n2DQADvZa4
	Rctj8d3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYy9-00000005z1h-18zw;
	Thu, 30 Apr 2026 21:30:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYy6-00000005z10-10sj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UKNQ23007817
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 21:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcNk7RepMt/ujrNFBx69IMbbsGm9Q1Adr/Bz78TzItI=; b=PYdHJ+2gsMrTzFJz
	xgrHx1h071Un31Stlmm0MrLoOn9L4UjZmODPldQ6g2cL5Vq56mcbsU+OL929FnsW
	xx0ubwfzoLEGy1NvjBlLfdA9RcsZbdYACmFmlMWdTeKEmHQ6Hj3AjVX3gzeKkHKO
	TaDeUgtawC8ekirStawjWMaapgZOucTy4Gy+QOZSL04PkjUauLjvDeFZqQXsxsmn
	UO9fQD/uVHWJHFdrXVW+XGvL1lQHmqeaC7hjLP0im8BIE7oNYFy6FY8woH4fggcu
	lEYb3pYmMFa+aNH5uh3OmWnsHLKBM2PLRNDmAY86vbXgaXx64o+P4YikbzcDrySO
	VMIEkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54wb3vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 21:30:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so1595996eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584644; x=1778189444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcNk7RepMt/ujrNFBx69IMbbsGm9Q1Adr/Bz78TzItI=;
        b=dedU1xgQnD0zWf5w+VXm7ORbD7v+xzoDzJ/z6deANn463O56H+8oFeAXCzWsfT4kv8
         npjXwcCsWsE2jJx9AFyGXf7rB1ZunAumhzFav5JenHJGbGAvzUf6j8gVgllYL0+cv/Yj
         YpnJh2V2oXtsxkk5qeIhi1WjlPorxuOltAfXny+h04v0E2235VSqkqCwXtRwPZDEI9xN
         xUr4F4vI16ou0OBWd4k2L7l7xwyn3Dv3M0yoKkht5ERYQxxAFOV3goZF+xeGH9C/N/2H
         4pzEy6YcPPLvRlc63FKVqLJ3U0cmJpKnmLqQ1tW3pvc0opneb45M+vXbxBYmbUOWCjv0
         IxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584644; x=1778189444;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcNk7RepMt/ujrNFBx69IMbbsGm9Q1Adr/Bz78TzItI=;
        b=sf5wdviOz0jimmzJDOvohQnJrly7uw6K96NejFw6Sa1LogUT2NxMp5O/fxpyRodnON
         aztCjNjwWcsHPPROcbHyKpA9Kjz6hpAZd/lGa9xkU401RpYTjLfvrpnwg0tB5tRUz+0f
         lXpwl61ZVLGQzCNpHrqVXX3kTWMa+5X+FxIZWKHS7UefivriLxGJiv1RpVzqcsng9JOg
         M1jFx9fYY4hsBwJFA86Y1oxeGQ/PgAzf/NqQbWk/0ppTLqoumnCVfTw/iZ9pkn7OBWzs
         RqzLWFh3VmHFjQ5Z+olaxYnFq7ndkelEIq1vEsZ7w8T79gz57s8S0jfm4ruUeYGCNxJb
         Y9Kw==
X-Forwarded-Encrypted: i=1; AFNElJ8mb3KTte/HZlD8JfV6lzYCKznl0NKQz/PYTAikTon91zp48+8tDd9QZQ7xzVCj6hgxr6HzJPIkL2WHC0MqFUr/@lists.infradead.org
X-Gm-Message-State: AOJu0YxF1Hg877GZiimWVRwpVvq6MKrSUoJOq0sWKkA3ahWU9ZfMbnuU
	CjJpQBskHXlvaIaHG7iNbl+jcri/1268ZG+nlbq9lagFdcFzrFqUXWy6qANJhl913dnT7W1zrnl
	6eZEsoywLk11l9YVhhbJnOREYcKSKLRa+i4aMifW+kQU40lR53fczrcUYhzPRq0H0rxIgE2TrS9
	RIg+JCoJKxmA==
X-Gm-Gg: AeBDievamFUY3WvzTmfSNMa6CPPVRlp5lcbJKFMxsVIRsAcm6r/0nEYeAe8n61ThlKe
	DgwfkFL2wAm8hQnLCwWm7KRqNd67bbTBSOsE5QMZTxKFdDEknCFPPOL7QJ6cDZkR6LFXLPvo+EI
	92Z54MuZZamMnMCKycyR5bsrn1UggiuNaHpvEMAH5MbBCcCS6oYOPb30psNemPFRh2Q18fKcuz2
	oepd4YgR5goq4aXngPBduhn4maTSi9c52+mveUAL5N8Je6xm5YnVynxZnl7zKvodQMAOJaL7A+r
	82GROx+DU+kFSzNSr6V6ByvA9M3kjsg9oc8aVDGkwe+SMlnJYdEok6fU93ezKnsi2YRVigrqN6D
	vpKiibUgUnThHKkGP2+zARofLiHMs4tPotyxzktuuWyKyRyuFnbFMgm6oyX9KsmTes1BQI8s7jZ
	AxB+klO+G8QYI=
X-Received: by 2002:a05:7301:3e19:b0:2d4:62f0:b2d4 with SMTP id 5a478bee46e88-2ed3cabac36mr2315492eec.13.1777584643498;
        Thu, 30 Apr 2026 14:30:43 -0700 (PDT)
X-Received: by 2002:a05:7301:3e19:b0:2d4:62f0:b2d4 with SMTP id 5a478bee46e88-2ed3cabac36mr2315475eec.13.1777584642905;
        Thu, 30 Apr 2026 14:30:42 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260223224254.27081-1-rosenp@gmail.com>
References: <20260223224254.27081-1-rosenp@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath9k: owl: move name into
 owl_nvmem_probe
Message-Id: <177758464176.1848985.2839439458090634520.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: HMivkS3cW1TFM7xUmieJaYUkk1oAyTgh
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f3ca04 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=loNhbsbYXzCzQw8Vos0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: HMivkS3cW1TFM7xUmieJaYUkk1oAyTgh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX9jQaOUERdK0p
 Y8Y0F3caZC931S5V6S+pvjDynW+aUIPdrPA1TAWgGd2TkKFNFNsGQY836CuhsTIdm03XLDpb+ig
 SO3Dv2XgrU16cs4oE6MMw5jiXdFEGPRAb3fubTajfx+wgUinqguW+5Zc9W+d+TW2iP1g6ODMyxM
 10m3S3tczCSTwxo69zHlQZ9dBgV3o5FP4PIu9EUorrRnJG87Wxye4BzxwaiqW3epXSfMnKHFy2o
 XGyDSNwNXu2pEsl1pViE5Ta0tzti4JuOcwZu0vQ+1wexapintCE+m3UZe+Fi/YJxytv2Hu7a02N
 SCcSE4BdntOgjM8aZwYZFaGCe855B42LZ1PwAwyfsTtzWvKttduk0zAwMTgrR122eN/rDDKpuAM
 hPN+Vm3xrYJH64TCD6vcbZHqvjyqxvcxGT2vRsJFDmJWUB8Uim6eUsK6oURgeaSwBYuOl2jyN++
 QmxtwmMtzx8g5k/1wfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_143046_464648_4F2725A4 
X-CRM114-Status: GOOD (  10.42  )
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


On Mon, 23 Feb 2026 14:42:54 -0800, Rosen Penev wrote:
> There is no need for dynamic allocation for a simple string.
> request_firmware_nowait copies the string internally anyway.
> 
> The error message on failure is also wrong. It's an allocation failure,
> not a find failure.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath9k: owl: move name into owl_nvmem_probe
      commit: 7b2338d5ec6fee29f92fae791219ab9fbd206567

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


