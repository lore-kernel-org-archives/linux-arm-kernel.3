Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F92BCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 07:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=; b=qWft9edYVQAaKvQDLk+rvDy4Lg
	7c1RD91hbKedCLVSu4n3PW70F2faoJIkbG8Pjbnvvx+jFW5pTR1XIKavn5w9sJBXycYAQFY698YI9
	+HQ51sZxgWuwIh9FKV7yNOyU8ZAlz3hyxrOe+B+wreqRI2z/9L9WE7nr+AckXDzxlXTwBksMgsicf
	iEwzmvx6Zw1xuyLLEHZ3TW/rTqPirQNJrHmGTOwdd2hl1IKnd0ddzeLDp34ckywk7w/RMskEamxBm
	hhSdljEC2xw/SFOzUeJK9rDW8rZEp6gZ76QbjdvMrujvqZwRTiGe4y0sWROb182mZGNf/m50VhE+l
	AKflxjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiFR-00000006o95-3QDU;
	Mon, 19 Oct 2026 07:57:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiFP-00000006o8M-2D8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 07:57:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7jQw91579265
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 07:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=; b=fN/hrEPRMEN6Tfce
	lE0pUjPijZU928u/hLVXYEnbWOgZuRXf2jNXySdQ2tD4FE18Pqw2wuWL+vSHDfuL
	KIm+WhgYUkPgjXlZIzYFulEc6F7YsShAvw9OrclDpoSzPnxAnyvjmHjGBfJ15ARN
	48WHNfDmTeoLAkf3dvUmno+vRy9ComlqkfkBwrp8P9MXSF9L4p4XzG4bq3okeh/C
	k1zJiRaISB7Fwl/pGK838mm80u5+XSTRq9snRs6ydz5QdZfUy14ELjj4VOatSFov
	TefaTv13E940KtyXb0wPOWqe8cG5q2E/qmdHczFhgLNhC8a0y+AMiEkx/Oazu2Rt
	w4UIIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0197-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 07:57:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso535753485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396649; x=1793001449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=;
        b=STdrCL4onB8Bph39q6W4GkV+uleeDJ/DrBlTtPrDyZT6sOdpCWFLV4DWW7ivgwbkgm
         88/PyrJfF0Dn5tLX9/Toy4QmgK9MoXjpc5OofU6sZLF03F5gd6hx+mJvW4sUCxVcsJqi
         dSjyS7fCrU4jhN5mTzEMPxTANcRJuDH3zSV6T84dUaOx5QDFFnlEzmgX2wr5QwUNdGrS
         dvDrNoBvCQ/p9j4R7yiPIe2sPStkzmKV9aI06jth37NDmmp249EZ7RUnz059Fo6wVrqZ
         NMXCzNocBcT5mJVzdWIWVqGStQfqwdlXWB1TZzsOGWI/bXApnHszVFGTXD2nnHcExL0d
         hf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396649; x=1793001449;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK7lFhQUw8fB5ffcbcr+lqba/Far5hOtw4MuBbSmAlo=;
        b=aOro7jDfUPCcZ3rCebWiNJXnomLqfUUXhqkf/LiG292poggoko7dTuTrVdPaIpPuZZ
         Fvq+VoOE4gRyHbSzN/2A+08hXPQfL1bDio/jy1CtNwIgQt6yOT2C29SVjcvgsEpTynNy
         O+FTrqoi53MiPLJ2WF9ep+b+wir9uzVLSRMx0z0eqq6qcDNwKY4NFRCrIWJHHMSMQDks
         NKvDzG9xcx2qyhBSTEt9CnTTSpNilZvvTXBpqSzC/hgR3Hqe0727rEW7C9EYZcdlu4b/
         l5m8QQt74XPkxeGa7eRCmz1s3d8xrJ2/7z8aM/uIRQC5ZV7W6MRkwEe9opsSD+xWnalc
         30VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMR6PUAsBM6L+Zxf55v3PqmnBezU4F2CBgA1D91L0KbKMLl5E6orQLoRK/zGr0JMydWS78yxKHGgnQjl0oMdkk@lists.infradead.org
X-Gm-Message-State: AFq9FYKKpMUIkGCYPEQp8IzayVbOkpVKSWEmbmehssNFJdkB342IvHlt
	cEwGtXZGEZK68rcLi6+EUWkI5z9QUh+FlXpzJVEtUf41+9qJ0RYuIVTUatL2MmqXcwQtura7LBn
	mxyz8sbf3nWtA/mfkzdGcfMpiem5Em7iq0nvUAY2RaVfPEdA8bkVM4Cx8jgXuQUNWqOuETkCCBB
	YWeQ==
X-Gm-Gg: AYBFou0y4TTSyQk5eGSPLrfJkBePHPxD5ZAufHEmLyRGLlQ3Xpg/b33/MUg1lVAoHOs
	Jhar95tHh4ZV/GhW8KrEmsJLlHc6g1K6eulht5K63yDUGykWj01GvjlJKn3AtU9f4wqdLWprY5g
	Mq78FejL+A0zJkGLxpjaVkPRcaGBAC+MHVCu6KTk647L7v37M3WO+7yDR4Kxziam1VJ3PG0x10c
	mTTQXtqvy7pWPbSgIJOFotbW8rEqbkW01/JumEZhfM4YYFJHHAEbljlI7cBdAS3OoOyrVyilcp3
	69URLT9DK4lN1ZEW7+cRU60sXdG7B1pf6CyeVwbkI2xX3DOEBLyqNhCsXDXCcd6ytRrA5/ZGSwb
	bhBeb11j7u8/K8aZC241nQOmQ10Q=
X-Received: by 2002:a05:620a:45a7:b0:939:b053:ce44 with SMTP id af79cd13be357-93f17f232c1mr1703872385a.22.1792396649120;
        Mon, 19 Oct 2026 00:57:29 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:939:b053:ce44 with SMTP id af79cd13be357-93f17f232c1mr1703869485a.22.1792396648551;
        Mon, 19 Oct 2026 00:57:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm253558125e9.7.2026.10.19.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:57:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Jayaraj Devaraj <jayarajdmit@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Mon, 19 Oct 2026 09:57:25 +0200
Message-ID: <179239664152.5295.18206280425730298577.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016154209.23193-1-jayarajdmit@gmail.com>
References: <20261016154209.23193-1-jayarajdmit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfXxVFxF2BWcZFZ
 VOA0q1kB8so6nFIAn3fFgItToQMCvy9qsxQtUbBj9qqj4ZRT1gcAN/Ig+oF8WGrw9gIf6G3tRLr
 3nRwuIexs7gYvkaHUstJ4YprRD0GXh4=
X-Proofpoint-ORIG-GUID: OaV23BaIA_r5HkbuWh3j_Jhfer1DQua5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX9GUlb04q2bI9
 R0GMlzN5hId6me8dbqUdHs96jJrz4+s40rDGD35ME3P2ZDFlAIvyOIoSEFgXXZzQpjPhWT9Lee4
 xEYrRRL1SItEH0gWpFqQTYKPwcFmzdY3K39r057u6fxJvYeAgbtdIIs6QHktXF1ZCTxm+jHCCNN
 hUSwtSsiKlFs06fezxINt06bsrnhQUqpRJ72Pj2EmEcQuny3RJzb1wa0darI2NK4Af6Zk6Sy44V
 68kkro//e2xbDB52frUj/inZWWBnRcFmjIy8zSj4sFP3hNItWA6wSTg3+Cz4AYuyE6n+ESAfB0d
 S65EwAzZYVO/Ea9vK7fCo4/KdnrAFMI5pLDBWyupMBFjZPePZ3JxE+4UUXZeInNHTxB0sJOfwVL
 qZ6DCnNeWITvrgVtFqHHU1cY3iKy2Cjdmfy5M1+mWfvDbUi6a2FxY3aNIVY1Y3Al+TKMN+cK2vQ
 3HWM/7sSUkq9oxKjJjw==
X-Proofpoint-GUID: OaV23BaIA_r5HkbuWh3j_Jhfer1DQua5
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5cd6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HUrnIdepTNFFqM0LFW8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_005731_573527_AA892EE2 
X-CRM114-Status: GOOD (  13.50  )
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


On Fri, 16 Oct 2026 21:12:09 +0530, Jayaraj Devaraj wrote:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
> 
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
> 
> [...]

Applied, thanks!

[1/1] gpio: lpc32xx: check devm_gpiochip_add_data() return value
      https://git.kernel.org/brgl/c/c117172a46c5169b28293003a109c0cc7b7588d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

