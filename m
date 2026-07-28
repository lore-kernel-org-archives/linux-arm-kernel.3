Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC7C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KynMNtPTT3Ht/2TnXMaMSG+Rx/1syY4qqJ+wQXKDRcU=; b=X8ob3F5yMqXCD8y+BDvIk+HsDP
	pmY3HYTFtmiEU7/fpV65api48VXC7+mjVl7bAVKsa/3OWXG6wmJN5QnE67JoFK200cuP2uPrp8wSP
	LJ3zphR8uBKrJ5j1rGLiY05xlp9fYl73KVO2tXRoJxmoUSqcCR1ZF5uNcPNSEMK69ilRNpp2uCT56
	G1/bjOgZ2RmLZ/aPPu+pncfhWXwDFmOs9YJtQMBpfTAKYgI0yY+d2im8OVeqvSocVi6Sa549K1CJZ
	hLUAZ7/Ki1zG7mYllSoXViQxadLbXJXHGvsOukzld/OdcW8AoHRTHHKEy0lu8cZAL2q4tVU67yhj2
	kvPYPxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiTB-00000005QfQ-0qir;
	Tue, 28 Jul 2026 14:07:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiT2-00000005QdI-2NxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:07:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDPXDL3030802
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KynMNtPTT3Ht/2TnXMaMSG+Rx/1syY4qqJ+wQXKDRcU=; b=Ji3iKGes+pnIqIC5
	2vwLwriQO/KVlU2l/zvC5ds1KgcAuhcG40FHSpJt+dAvZ85xExQXWxwO4/3m1qCI
	JrEyj388AnSacILUUDaNoomwzszlRQFqKZruzoQNoQPm5m8vYrcbtMDz3oZvu5W6
	jSbBTc75QTvy8ViXrqeUMDoU/PZOa/1LxgmcdbGGSIceIsFMiP+Bc7TylHPhUBrO
	DKrKw1zpEokjXBmRMdAkrNAeaEYJwLDI4rnUpj8W8yVhMnuLBUkiz20hKO1MLm+b
	9kYxHtQuj4fLbWbz+x8UYMmhF+acyKF7pLrpO6iq0CKnwsfUdx6CL6kLSK+583eJ
	xDjdDw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvtv8b9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:07:35 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c106a0bcc7so286683e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247655; x=1785852455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KynMNtPTT3Ht/2TnXMaMSG+Rx/1syY4qqJ+wQXKDRcU=;
        b=UbG/BpXf9wZtVj72X+ZX6f7FWJKfTrmy1gEwd5243JVO68DnYAYl+wd7/nbKTw7Vmp
         8W9Y2dLpQ7uGlGt74O8iueJLoWmwEsqvwOXno2nmc/ZgSCllCAIprIXVU0IbWWqi8OBz
         FayE37jzRBRJJ4Mfdqo7msT4LBIMT4QO1hu+RISIaIHhl5HLMQYnm0/INq7rTre0CV13
         xnxmmLQO1kVK99DG/hF/mF8C9GkGj/SnHwQCy8XK5L6QramsW288SNKhbqQyUyTgEGoj
         n0JN4Z6jjq++eM1HoZvTwoRG4P0AsBwLwWc3qwOWetah9ytzp+km4hQwWy0/xM23W7B7
         Ra1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247655; x=1785852455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KynMNtPTT3Ht/2TnXMaMSG+Rx/1syY4qqJ+wQXKDRcU=;
        b=RqzIfIZbVdiP9N6MkSqhSSwIUpT3Z+wLy9vXB4og8BxjXb6mJ4WaX4wS5aiSjZngb3
         MzTFAQctHnaC3XcTA30xt4/zzqfkzTeXJPujokLqog2KfO+HTzoA8nK6tJyR7SjHMQxg
         4YtLYKTyqAKck9TNe2Q5eP/opoJLIU/wJYjMIV9lrZoZilu9jD48Au2u8cKYkMONhfyD
         Y+l7/C7EttYY6JZMOCSdzGLJxu4Cc8crmGyG4Km6zzz+pCc1BrnvrJgsw+VKRIY/pDr5
         AaF/jEXufQFpGh7a4YUe5kljxEvj0dBakqpIUQVp6mqeFcExQm/H1bbIDEQBHqb8nPYa
         qiIA==
X-Forwarded-Encrypted: i=1; AHgh+RrY+hCFzbnczw9+dUBqdYl3mzlnid0mQrS1cpDDS13Lw7ePim5YLsyhVqMjuWksEOIZMiBBCLuzmbJgn4mNgMVF@lists.infradead.org
X-Gm-Message-State: AOJu0Yya7OvMkdnqhU3EHR8iI+GBbNDW4YURLb+0LWQh/9Pb2I7x9+OR
	yg33zUow3MODF74M4Gh/b+3iVaKwa8o1vY0qXRIKuH4ly0yEgsoIQdSgKuwGC/hLoYDqH1d3O2o
	4Kd9csjRC6X0Im16i/a3PayjGDK1nX9pn2D16wMWegOTlZzjW7fQTZ/iZ4BqfT9cGJdjiOSHfTa
	DajRhyVjRwIg==
X-Gm-Gg: AR+sD13aMp7R/C2ZtBtuiz1RQTQ5u4so/Tu7sMDXzT+ILOFJqD9gRelLqPQVkRACO+O
	dj8MblEQ0Puex+cvJl045tABxXwc7AYOT8sDtDsXU5d8Ho1fPgicClbK5LKx4TepG6ofuiFeDyp
	9wk2ed+g8XOWRBaLlU4+jNZZ3MqVVMDQRVnRwFhOSx73u9xJUWkTys6/KAyrYcTl0eV0ElUr4jU
	y7BqHtZz/DxJhsrzV2GjgMnKt62g0QDmVWMhJLvCxHJKd7Zss5iNjUFcF4H/o2DuZTEo48IuT9o
	M+H/RUPmMDFk6rzkiHFUDSHB8zSgKEyWKakgixxSIyi7YwRorH4EvO9Yr9bBRaHuXj0mtUZjsIH
	k4BVlmDRlj9wCgn/qSJNnPRmGYGZj8Q==
X-Received: by 2002:a05:6122:d06:b0:5bf:a6dc:e631 with SMTP id 71dfb90a1353d-5c33fab4edcmr1025958e0c.14.1785247654837;
        Tue, 28 Jul 2026 07:07:34 -0700 (PDT)
X-Received: by 2002:a05:6122:d06:b0:5bf:a6dc:e631 with SMTP id 71dfb90a1353d-5c33fab4edcmr1025908e0c.14.1785247654328;
        Tue, 28 Jul 2026 07:07:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d2e3:b407:476e:c977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a9451sm91612285e9.1.2026.07.28.07.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:07:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:07:16 +0200
Subject: [PATCH 1/2] ACPI/APMT: use platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-acpi-arm64-pdev-set-fwnode-v1-1-b5aff9b2235a@oss.qualcomm.com>
References: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
In-Reply-To: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: brgl@kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9+NRNC7cz7+H2463EMV4gkEfG4tiBnjiHz4PwOIzpBI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqaLegYDEZQ/sUueBDm+sOifDJjJLZO+lm/xUdk
 Vs4COMdrj+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCami3oAAKCRAFnS7L/zaE
 wyxHD/41fquWwn5r2rp/8s74FTTjwav08U4/iEn9J43mZUvktNRAiGXaSvony+AW8DYrGcJP1eF
 Xo4Rb2G8iOBtC5Irex1dDi5+4lxX3Tc1eHR72M+M9I87POlDKeB9rlrgy3KsIZOsHJxAGBUrmpI
 6/quYhPmvs+v7xH7AXinSjKfD9VYkaInBX+nJn+6Q6tm19QDYHEc14cDL6NCL84tRd5hgSWt46v
 s2niSH+O9nQmiejtCp1oo0CytSaIeD9l+e9hDr7oIEDv2LMn7w8ElUBYZI85AtI73tnnHtdjltq
 3zOynxa23pHWxEWBGlrqaDRdltK6oQfkl/oZbbNniOtISIk1DCifmZNYGNAxWjg3zVoPmH3N8oV
 YRTiNuA+QzgumK94GC9VNG1DL7lbC4+jsyH3d6QGBv3XaI8Bb9yar6hFi79C5No4sigXeq246Vp
 J5PxSIu6DkWoNPLme1S9olYoBp9CGs3ghS9uF0YrP19qMYFNsKc0NdD0utrxk/SsHXSgQedixSE
 jOh8xy4B35D1AZzhaSvDKRczaVNIVDqAPJd48hZWIt6NcOUvkXSpVbuscOQsQmjCv6Y67shvD7X
 gPhwAf+rOHNYF1gBNIiHWs4UUrCQXA4JOQDYbQbG1ENWPDid7aigd5K0JMPtli+QKjsIhGloJiI
 +B+z88k3SUdMKKw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: x6rGlDWalwg5_sIPmf-70r0KmH4fYPLs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX8E4kU9ewxupd
 a3GhEoJlLlPl4Cqrh4mdwv9vtey2kFt0bZpVMPS5ElYkWrpmnB4GloZz4U7JWaO864vUuECgeUK
 /1L8Y4Q5RMKq3WywuBn9YByeupD0n+4=
X-Proofpoint-ORIG-GUID: x6rGlDWalwg5_sIPmf-70r0KmH4fYPLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX5RoRuTO+jPs2
 4o8Wy2WaVWXQ/ckZtHNSgIXBmWZoBqfqhl4ca8iK9L+lmEY9iiUKRLZfnna48T83jZQyl92f2Ai
 qlRKnZRN7A5cpcOpB4uCfrKx+LuWXQmsvJUpXWeoRntTq6/UrEZH4iP3iLqjW9G5h9mJr2yY55V
 0wXzheR1uSSXN3rc2YhVmzI6cU/G7YpGehwvJotcIfTg4T25bvrskyo9WP7EyGZx1zzkLNe5MIH
 Mg6YrGg7FBHKMSSLxWkL77+03R4wXzh8BuvS4jaE4qwA3GEktDgHeu4OxnGfVIPtscdREpXZxkm
 vgAixppehmgnaqcdckco9jkUa3w2N5DNaFPtHB5XHw0PMuE4tdzKmbJ9c2ABe7UZlvnIrv0OqJf
 zWR6dQXNibhuQSOSOK+LtYnbBK0ha5V03iezFQSreRmSFvXBlL80k+W7aS8ESwYM2VbWz6aC6+Y
 OLwpB684HTo4N0y1sYw==
X-Authority-Analysis: v=2.4 cv=dOiWXuZb c=1 sm=1 tr=0 ts=6a68b7a7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fqL1emIZdJcgNPYfUqkA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_070736_726752_53B3DDE9 
X-CRM114-Status: GOOD (  16.21  )
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

Platform devices using the split approach of calling
platform_device_alloc() and platform_device_add() must not assign the
firmware nodes manually but use the provided
platform_device_set_fwnode() function which additionally makes sure we
track the reference count of the firmware node correctly.

Replace the manual assignment of the firmware node with a call to
platform_device_set_fwnode().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/acpi/arm64/apmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/apmt.c b/drivers/acpi/arm64/apmt.c
index bb010f6164e528acd802f65afd80d65a57f5844f..c927e4f08ec2c98137d4e3c64ec1709d672ad9a2 100644
--- a/drivers/acpi/arm64/apmt.c
+++ b/drivers/acpi/arm64/apmt.c
@@ -99,7 +99,7 @@ static int __init apmt_add_platform_device(struct acpi_apmt_node *node,
 	if (ret)
 		goto dev_put;
 
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 
 	ret = platform_device_add(pdev);
 

-- 
2.47.3


