Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD8ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MkxY5VHM+Gf4iGD+fZqDE7SlRll0D0csA8BjLC9/20=; b=VDjgPYHysqyzS79Hvs9guvEaD0
	j89aYZWuM0/7jvi0h/Wwgfr78f86gXzFrGQEGBDI0FrzLThDRl1QRvYeqsWKIUgmMSXNz6y4W9d6c
	jQyE0dwuom347nFW+y7wNK8sm/g7KmdofNavJaEhnEOYpVBhcoLteV9W2HjriHTk9fV0R2PSht4Mt
	VLcLkvMe5+LNN0IuoSHiVrBn15tyUfuJbgO9WwC74uLrvxb+oHKECkfzTlspqDO0Mu3DJm+wCwD/k
	LxeAz8Bl0g8YcI/2swXTKqgtZuU4dgAKBzGJWpveCASxSDykCVTxSF9pvcdJ8Eji67Oy7LtS4nTK/
	4hqD5Z1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9FF-00000003Vck-1OnB;
	Wed, 27 May 2026 08:04:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9FD-00000003VcK-1ojW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:04:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R6G43r1803459
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MkxY5VHM+Gf4iGD+fZqDE7SlRll0D0csA8BjLC9/20=; b=Z5csz6s3ut2SvmjU
	fXVeJy8Lmi41Gg1aCF3w/dxNeYKrIN3/op2Sz3iZjBvmxXaTF1Bn/+5BRgeuU+ty
	jygZ4bViqwOwsD7V1eoa+O4IiPUFuGmMz3+z7RqSBdFjAWjFggdZelmGmWGc1bwk
	V5nKBThxTppHXJxI3B5v5wQAIUZaw/hjmLurvo6WBJVqDCS2kD2XkaxXBFZwZGCW
	s2qsfnL+u9JgY7DnuXhzH0TygVPZjjdWdQxPwDkRTfa7WvwprKwaLGQZt4zZ1aic
	dnBff+nwfXjZ4+nyUHzAcCeYiBhxXpFhGonEHCrRjHUMN8TSJo+1Xc25uA1GQo5Z
	xqlggg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgcv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:04:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516eaf9fb76so69765811cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779869041; x=1780473841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MkxY5VHM+Gf4iGD+fZqDE7SlRll0D0csA8BjLC9/20=;
        b=kUaidirmMLnf4qtXJVGCoHza96mzENk8xD42aat+K6K55EJjsVbqxro2kt+a0sEBGL
         euh6+x9LqM74DUilok281cdRzm5ChYex6lcTFFi1jMHKyaUbE5GYTrql8H1O5llP8ibl
         sPkMVbjFJhpNMooxCTBU9pat41OkUKxSM0iSpSgtFRzDKBhq0dJp9YlWl6D+3xAIKSfH
         32Zg3AzxKZL1ZMwly+lDAq2zJ/IFW9FHuOzDcnCw7Brmh1Ei6m86mOg4+PSVzVcqafP7
         KVYYWxJXe2wg/ixbTEc6l5GziEuRZ1fHHp8VnbcTajqOdy/xGD0uLPpXmmI3+Gl2+Tfh
         SBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869041; x=1780473841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MkxY5VHM+Gf4iGD+fZqDE7SlRll0D0csA8BjLC9/20=;
        b=kNeJD4JLwR+GUnkcXXu/NbN95WUNcc8EIURcxiIPIEVAA5LpRUYGxbhpxC1NIPL4as
         z85svXbbDVlS1u6CXkjjFYGDBfUqvPOg9WKaBbB3HU/wU6C+8GO3usLi0EJzFSS//hQR
         cX+183auQOh5jdePXVbboqquWpPCDuAP34BL7Ca6kf+NmJxkd/xCyzCy2FoDuH3W2LTW
         8XT2pidH2SwlQTRotvtMFOpfUP1336xSnSlIBA9Tj9zGUlzGWOFmUOFz0DxpPytFspQK
         tnPDQwvXmcyix7AVlRRJwIB3vdJmpTU1fedCnalYbetBD/THdNyEhWxIcfDLZUEDr19c
         Ungw==
X-Forwarded-Encrypted: i=1; AFNElJ9sPRYLxxxJBckUqHwiJQiBPEreJ43AAwo7GLCwUKzsYPVFvs6Rf4bZAT0OwXBwrSG7EH0p2dqnNe6cYLK+L2rr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8b6W89/mkUUVA+8mkFK9IlnAUC+L7u9QiP2yzk//6+u/TYv7h
	zKgGkHT3jhTZwwhZfDsOMIiiHEEBCftTvLrnk7YOBEKcd5ltuv9uj/ViMOkrZ6mtUlSZbe3f6Nq
	J8zX/t8f1VNji6KAOgwbBlg+0cVE5VSsY+X7T1p/70F/97FBR+KQh88SyStg8CMhvkzy8pug/p4
	rShw==
X-Gm-Gg: Acq92OEZiI+YlLSL3JHg8HIJSBv2K1cEmXPyy9Ht4K2Se0etfMZ/yL/XNY4oNvCox40
	KWFWpxG8866UxVoXk6C5EU4BEt77ASqLmuA636AK4Dsp/GTdbENTA9OX9ITyUvO94v0UKGOKQ69
	7PeePWuKJ7sM37Cj8FDxZqwmVw4oZYP96QXiLp2FwgP+v3OT/Kwig6swPNUfHy/HCEjhGSD5DFr
	1XHQ12dGy1ZfHfLUbVAuwu9sQgiWcSjnSBoLUK2x3hKXQj2vdIA+aW3GNTZ0/2qa0RyfEejzeMM
	etenhShb8hqeUjeBcWQeEAM2VNxKpQ7DnYmKv6KrOk7K4pgKw5kmLxC41b/1rLe41k041xsWOLC
	j0cBTneBiDVfkxD7p6P4tXE1QzF4/fP2YRTyxLdAGK95zlKp7X+cfP9269ccQ/NEWWna5C7tJyg
	Rq93HTtVUdFaPADaaQTWx7xGXo0l42//xackesrfuDq6vYg4B/eQ==
X-Received: by 2002:ac8:58d4:0:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-516d45b200cmr299429701cf.16.1779869041120;
        Wed, 27 May 2026 01:04:01 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-516d45b200cmr299429381cf.16.1779869040697;
        Wed, 27 May 2026 01:04:00 -0700 (PDT)
Received: from brgl-qcom.local (2a02-8440-e500-3194-8c70-1be9-4d87-8bf7.rev.sfr.net. [2a02:8440:e500:3194:8c70:1be9:4d87:8bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a198sm371665135e9.10.2026.05.27.01.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:03:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for GPIOs on Nokia 770
Date: Wed, 27 May 2026 10:03:56 +0200
Message-ID: <177986887080.4201.14057302691715759454.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16a572 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=akhc-qRKS61dJtW-bLwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA3NiBTYWx0ZWRfXyc/mVxaQt+GQ
 yzHC+KXtYgdPgYcRtdguu6bxbhQYXCzstyFCxJkkjN1yMN4Uq10QwlMMOUfumLCJbUS1Mxwtwgt
 v1z+MxuuldpFVYKa1Nk5JBbHgXFCIdKVUcDDBb6ejuBeZ4B74RIukhf9BuoBsB1sOf5WIUhwRic
 Lc+iQk2+GkPHGSTPi32NsM4OxUwXWPbHBlVUJuVZl49u579Y4eNmltaignEmGRt7ZVTesihavdG
 mxqNl7DHcYH3msiO7ANF+tl87xOZ3AuWtA5m9YkX8BmTchnxexFWG52SYo+EdHjI/9pP5GW3Ob+
 QYVIav3bMPc5k6004bLui4oJPEoD6syaCCY2Aop3MvRsNXfvvcNMN+tQ/tYZzrSLhPMNXb1l8qn
 5v9VyWyhvu1+bBuOTKjoxstj9JrUdKohFfOHsg7WuMyEVyOviYuMbcKEoviFW80JCgxlvjgcmck
 D3LwLLc03LpJgsKs/YQ==
X-Proofpoint-GUID: 2RXGMh9WJkL5DAxLu2NYvaj970tLlJia
X-Proofpoint-ORIG-GUID: 2RXGMh9WJkL5DAxLu2NYvaj970tLlJia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_010403_478691_EB4C4C26 
X-CRM114-Status: GOOD (  12.59  )
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


On Thu, 30 Apr 2026 09:30:54 +0200, Bartosz Golaszewski wrote:
> This converts Nokia 770 to using real firmware node lookup for GPIOs by
> attaching the software nodes describing GPIO controllers to their target
> devices.
> 
> 

Kevin told me in person I can take this through the GPIO tree as it already
has all the Acks from Aaro and Janusz. I've queued it for v7.2.

[1/3] ARM: omap1: drop unused variable from omap16xx_gpio_init()
      https://git.kernel.org/brgl/c/3288e99f9968c37a8b654d5f4251382fe11bf854
[2/3] ARM: omap1: use platform_device_register_full() for GPIO devices on OMAP 16xx
      https://git.kernel.org/brgl/c/2bdf432e15818a81575e691e4ba0e3a3259d1711
[3/3] ARM: omap1: enable real software node lookup of GPIOs on Nokia 770
      https://git.kernel.org/brgl/c/61442e46fb9de57718a36f54c9ce1ce66ff7750b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

