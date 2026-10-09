Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81FACA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=; b=Vt4bxOcqfEnnIbw9dt9RjDwd4y
	taFFhCRzwZ5xKJTOqA4ilSd74vqDbBhF/Av0QVZiK9BsRp4yL27AM6PuLT7wDnaugjqxJTueBp/eP
	Ivs+NS1Cs3Psrbq4QdxwhsUeTgv1pSwUkXInl8qIjKu+pt1UDzTPcgRajFJIqR4POEh8acmV07HTl
	UD1+60bkJxvJG09FTa2LWR8JpEPr4CUkQnrSdqWC/tgM717aKDxsL/Q0M9rYlNbEDVukjqUB2iJA7
	QU3FMJ0pBTCeYYB2jXQ1VEHQc1zSxQRKVXsI+1wp+jxipYJ+gaVaczRyTLv02syROkrFY31wtEB4q
	tGBPiajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5hm-00000005n0J-3QBe;
	Fri, 09 Oct 2026 08:11:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5hj-00000005mza-49XX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 08:11:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HIEN564672
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 08:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=; b=fzcMbtO/4jaXDsL7
	gyiTrLMv+dryBtFCkSLJXLL6xRC3loCmHoBxikesbtcI2n59pEfjAbFFqVlys9cK
	wgzZbkBfOCDuOdR728Q0enWZ9JbdarRUaf/Y5t8zWkQ/1Ad+A2Kw6W73cf/sGLo+
	TH2ZrS7MF7HIwVJAirB8J48huJvqMPKmpX2IIIxaD6Iqfoxi4p1nQSfvtbm+Kb+X
	IEGXn9VvZ6c8KC4cvcFOER6dWWmzUmAHOX7uIaIsBDeu2F2vtH5KcogCsxd0iW4N
	8eJ/PG2jfE6q4ywIf0IenZsF0/s5ls/d09K0zripZ/U5DgTAYz12jurE/vDxZCiq
	aUgBvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkahea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 08:11:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so1238601985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533505; x=1792138305; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=;
        b=kQ3c+b04MV1/jp1VUP18NP5Kd1T77ZDAgFhbnS/fFvLxbnSQ7w+UZGCYk6M5RwvMzB
         VHXQDv3xVGc+X/szog5vvuEGFQ/32fYTy7ooSqrv6m18NUxIQE8Im5jGBUMqmjOjHS/Q
         kRWZpJIQe2G4sJMuIcoksN79BkePas3wQOsZfFGQh8h3FeqEvH5nMPE3Tz/bcoaOuIQV
         lgAQLaozmXdFag9aW0S4T+Rh/LJjjpG06UhWq4jKPc6bkI4b19ntd7m60HVawwsnKTLT
         hxJHA3bz8lU/yZBA2arBCiCTq/9BDrW4VDhtAvfIaz2HG0+V5EexmOnQY9NZzG00DIlw
         Q2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533505; x=1792138305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laHJsYnI/7xvkYGI4cOJBcsCLbJtIbGPxkDhu0frTK4=;
        b=BQuFZjYq1gIuWe8V5M1vKgHOpwTmeJMHOoInTEvBdgkIIwsaYt5r9kzzxcBysaIaoB
         GRGoKuaQj/dL2O96mFCSo6xrdmFNFsUOyg1HtdcOOHbKbhmWfNSDJeRqci9a7UhDJdXg
         mm56q03cPJ23Vs8ZlROFDTuygxL5FZ7xV1g3zwlE8WFFGM1XCnSKtBAqR7btPsW6fxEJ
         NyiOZXjaseDBIbYFa6f6XiRqxWywmwDOAypfslcJQoV9F8osOtGdsCIs4XCdv+EYwADT
         wbBrnIBM5oaORyccm6gW69w814p0r2cyV2Wz7XMwtY2k1i4f2ZWZFiZQHAP6iY/13Jrp
         A5Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxz6NdemKEiVtX5S73TCmTB5efq77CZdy1hv2ljRBAPpIE2l7mwCamg/txNRMuvQhiuH9Qa/zjYFeOHBHJxLJol@lists.infradead.org
X-Gm-Message-State: AFuF++lENALRcd10A+sk/CbzhdRXxwtDvrmhte4LaE/eMV03FKKfj1Bu
	5Wtg+AHsR+G9RBCqq10QlvioYEB4RFQKyluAfvkhYTBd7S+4rpGgvT+cIVyWqcEbFWbKh3fsgyj
	vHNSoEf1Oqq+T5pziRYhUwSZ7k8YjM4K2CB1Kh0l0QUcXklcEBICo5v7Lba0Z43qtaqRVYoDUbV
	XooQ==
X-Gm-Gg: AYBFou2j1Om9Ik1NWLwUYvwSn1mIN+VmGAR5hg+70S4duZDcpQcof84IeS2+49WgtF8
	sfMoYT4WRBt/gvnJhR1nG7+5w3Fp4qWxjE7giMmAUbdgEHzIOMnak5lI5lCOOjlMY0sp+fgf+rX
	F6lNigVsmY1DH9GkZffS1s5pf5J2ImjNgZ5dHu3cd0MdCENr+VluwpZnEfQ4kUoKU7v9BdtIf8j
	IV0Owipb4WPxRxvsFh4mIH7r34sJZxJN5e5CsZCxqmAn9hARTeNl25eU9aPoyKeiGGGU71Y5WeA
	muAytFDd6tEyUVTBLWcctdZ3+b0J91Cn8+9Q4wthIGnO8OxSEcaGk1EcRFRynnqtRzHg3YXc5Y2
	ByKlU/nGO98TQ1WsYcB9EHdt0wL8=
X-Received: by 2002:a05:620a:270d:b0:93e:976b:5c44 with SMTP id af79cd13be357-93ebd2960d8mr145640785a.65.1791533505207;
        Fri, 09 Oct 2026 01:11:45 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93e:976b:5c44 with SMTP id af79cd13be357-93ebd2960d8mr145636485a.65.1791533504545;
        Fri, 09 Oct 2026 01:11:44 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm65404655e9.8.2026.10.09.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank.Li@nxp.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, aisheng.dong@nxp.com, bmasney@redhat.com,
        festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        peng.fan@nxp.com, s.hauer@pengutronix.de, sboyd@kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
Date: Fri,  9 Oct 2026 11:11:34 +0300
Message-ID: <179153345647.1914323.1489876411002078599.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915055515.1730145-1-vulab@iscas.ac.cn>
References: <20260915055515.1730145-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FNqg0nT8kNcQdsXjBZ3oERkIjGNtno63
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX5XXslJ8YVini
 D4enHZcOZQBlSrH9SuflM4sQicpjCbInm171pCnIYnBBtosM0lC9L8KaNM+9K8Xiz31GAVUsfTo
 IWdX2qDnQ2Y+NRHJbGt6ow02ij9fFow=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a1c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DNK6b7R2SRMYshW6mIMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX9VmrCYKO+V4L
 QdhfjupNmfgJwFbibfzkjzbtDRtMdv/GvD3dNztJg+ase3UUcNNxZCDC+13ILvfcSGKEibPq7Pm
 X6k7fkvLPT7F7ToELj39KU7U4MNtbF6HI89CS9HiP8IrE4RhZR5hbqylme08fL9d+uUST24uryc
 z6F2zHH+b6nIV7Xmf3QvqDUV0UbDuNV6XQoGeyjO3PWhecedShxjmqbT/cGAe3Gv1bw74zwgF/P
 gUrhWAgsMsqYenJixk/mbHXEdydn53wYKEmzM1ILvZs8G/yGauWG1bZ6thVO0ScNdZGL/jQlcPB
 rA8TptKtxJ/6wNJB3Nwmkdr3qa7rHTuMjrvUHgmQkGzAevegqN3F92ELb/osopdnLVbQXYh5hJz
 adNdTd88w/azIRVkFoztP9mXAaM0SpjP66rL4D7Bb9j3VwotYA/2G6uFK9w7nUG+2jCEQyg0Q/q
 9IQmBTZh5f3BoRFwPEw==
X-Proofpoint-ORIG-GUID: FNqg0nT8kNcQdsXjBZ3oERkIjGNtno63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_011148_148355_B7FAEB74 
X-CRM114-Status: GOOD (  10.93  )
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


On Tue, 15 Sep 2026 05:55:15 +0000, Wentao Liang wrote:
> imx_get_clk_hw_by_name() obtains a consumer clock with
> of_clk_get_by_name(), extracts the hardware pointer with __clk_get_hw()
> and returns it without ever calling clk_put(), leaking the consumer
> reference on both return paths.
> 
> Extract the hardware pointer first and drop the clock reference with
> clk_put() before returning.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
      commit: 8e177ca735761a1f03e1dedffd7ab00d6d0540ae

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

