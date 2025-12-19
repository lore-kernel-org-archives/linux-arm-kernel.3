Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50B6D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KybxTilPBGySa5GJuWwT+FeqH4cHYbI3Z1A8wblr1wc=; b=L8Dch2lXzLsUzd
	BT3IemOjGUpIrzlgck9tGdTAR8tcGR5X19o5EfnbTu9Qwz57bzDuG0WWWzhJxD6npZqrY1pUe2+ld
	/fNRfkKLu8EuEPhmDNJ99hnpe/9IYGR1gwCKLCjSZt+PBdHVeCS2b7poecCUfHJPkuJ2j/xKZ0zmN
	7ddRx9GGXBHHELHxhcHTjwou9DyliYE0bd3g9KEAqZOqGbuixpV3dH4wR5LD2MUUq/mXL0gfb00ox
	N9n8atfCQRrIOabe8UN5aKUKOW8qF4lxZy1nEpIzBNdCHhfCIXfqkpZUbf3dzstjB8f5ANWH0qCPm
	bHjzm0HcS8no0Pk4Phyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXM4-0000000A0XJ-1YgY;
	Fri, 19 Dec 2025 10:05:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXM1-0000000A0Wg-0TnD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:04:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cMHP091962
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KybxTilPBGySa5GJuWwT+F
	eqH4cHYbI3Z1A8wblr1wc=; b=A3DCGqTLQgJQhz1hiifi+ad2gRSw9Q0jORAeWz
	zrCqXZdPxUIVCnxF9wzeZoYF1GsQV1YEuTytRbPB0q+rirbjVErQ/zH80TXhGUAh
	/dtH1loP4tJMz+yRtFpNPPF8R8doaNXD4RlsRJfPn/iDtOfwaEX/okFaVwAJWqbr
	Rhi/8HDx5XJtoujHrSu0fZ27Ydy5oypEc8ZMjzcP5zDzJAvzIMEHNT0RCEyaiGaY
	BhSg2QW8q3/T/fpSU09Xyt7glRU4UWypy/GR8kabfVMf13OMMXkWdYMLO6EL1NIx
	rpoL9F23I9VJDFpdT59mmL+F61e0HzkZ1vZ5W5FUvna+Ox1w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ea7hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:04:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bb1192cbso29674155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138695; x=1766743495; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KybxTilPBGySa5GJuWwT+FeqH4cHYbI3Z1A8wblr1wc=;
        b=CMgWjAfej2NJOHGAuC7H/7AzRZWqUAjExOVoNUNulcCYplJBe71L6oqFHLPoOZ/yKO
         EKb396+BInLxLOTzzNfOn9BWi4aInJbw9/lGdNIfK9CPL8bHWhaFxiL36jlDMbSkFaJ/
         Z2xZFchVW/oYVNyptyWUyBXpCSw/yZkdFMxfUTG8XXGXPCcvDEsTPL7cQSIv9wRItIXY
         XxzoILFQrrE0QegzwZel12Qz7p5CwB3R+Dv7xneQ4FSMNNL4Zk4DFde0REIoTBvS5t89
         Rwh+wBOkEWdJEjAiKuQo1aVwsJ5RDvA/hPKqBsgAN71XLX44BhVyg6N4cle/unGR/JLf
         zaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138695; x=1766743495;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KybxTilPBGySa5GJuWwT+FeqH4cHYbI3Z1A8wblr1wc=;
        b=k2nfSnUGCqgy/gOrOYkDoscPjArsBA/odEpBAhAjJ25FdzMQbff5pbsBhmYAJvX583
         aJ30hM7C9f6z4DL/s/rOIcnlA/fv49ghMENC+Jv8YqSlZqroTG3GSV4NCQwdpkYiqPbv
         UO/YnT5/DmV6ZrWDddXswRPvXXJQ2NEzni0/aGQM4hjYq+W76aon3vYUwmXS0VzNmZj4
         9lnQPSXdnTnScWy47Gi854Bhdh0LuIP1ip+D1xe5qKKO5+GsXiTuGOuiHNXBEYljjUvO
         nVylqL41aXvttC/ngInseBfPzSabWHqM7AHSMiUQLo9sEvFMKpFxvMFs7k5NqM6lTnEl
         Zy9w==
X-Forwarded-Encrypted: i=1; AJvYcCXFcOOCKyd3nt+nErWFp4LfTh5lMTKPgyja4jRiuBE4lqEjGq7pHu+lkiHGw1+NbEeFtc6jW8YF00/JNfWBl7k9@lists.infradead.org
X-Gm-Message-State: AOJu0YwhHMbUT4UHt9AYkaOUqygk240BSU33KnzdLKHmxF3J2T0ooeQ8
	j1g3OX/GBOCXpVqGsPmHHVWOZiGRvklhOGBRAYOD/tUwZbnW5XmNyynl1nFZkk1TK61r9rx8KUg
	uMO0GrjzzfPSR2+YmdHOfA5Vz3KOGOCuK7/O5XeqaGj7lTOmOphCcIOGIMIKalVdi9I7NTtdK5n
	pVtw==
X-Gm-Gg: AY/fxX7so0V3yG0uMVFPybxaRVNuGjVo1hCzGRXRPnQSrQ+uSOHYHD2wZK9kJ/YNB6a
	+1K+VEA3zaEJ/Fqpuy+FDtfWxaBW6EFagh4ikARouGUSaZrk51jufFkV3AKQKDnLuuSoBxw8eoH
	NfuFMYI27tLMrU7zp6dwUrtVjSazDunQFbbAKPjxKS2x8tuy2/tfw2tMoOB/fsh2A4+uHkvZKGa
	rNXk98mWTqj9ogE3bJQElbrspzJt0UYb3QrcIy2RzlpT05rGfkUAPYaU1f5s9Rgz85A5nbjyT48
	3OOeH4KRwj8G3MsQeyPKOsl/Th4og28Bs56x5+9VtfX35qHas4fYYbhzOTdBVXV3emLK/fgQzq0
	FIvEq8sP5EsI51YVJulI8o+LIrZuP0i2EHvvccQrSQPdTAEaZVze8/D/H9kA213ICwZk8MI4A
X-Received: by 2002:a17:903:2f8e:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a2f293e0demr23888655ad.49.1766138694718;
        Fri, 19 Dec 2025 02:04:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDgAd+0K/AwoItSbMEWD8PkA8exGSBh0vTxPGHDWfWzB99dvoGZTmMr/zEV36gZ6gD4bWCeg==
X-Received: by 2002:a17:903:2f8e:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a2f293e0demr23888335ad.49.1766138694133;
        Fri, 19 Dec 2025 02:04:54 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d74bbbsm18164435ad.94.2025.12.19.02.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:04:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v5 0/3] add sysfs nodes to configure TPDA's registers
Date: Fri, 19 Dec 2025 18:04:18 +0800
Message-Id: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACQjRWkC/x2NywqDMBAAf0X23EATG/v4lSJLcDd2L4lkY1HEf
 2/ocWCYOUC5CCu8ugMKf0Ulpwb+0sH0CWlmI9QY3NV56+zTBCLUXaNiysSKNeOUU5R5LYx1oWC
 ivw390OyHvUPrLIWjbP/HezzPHzFg3RRzAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766138690; l=2034;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bEAvExLLTe/pWgc36eNON36Bt4r1uzswXAWHhlzieKc=;
 b=Y8AG5s6EUAzPCEXo+LftKyYfhr/bnc87q2LyZo90VHZVQm19NTYASMg0EWr1oJQrHWkP/0QjO
 Csk4q8dJy9cAxaqsK0zEHFAVMvNsZP0anSQkXjB/isSIwNkhi7QKHLh
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfXxmApiwFNRIi/
 FPkM8nByVhNwjT/2kKWt4dEtCx7BpVA5A6PcGe0yui+KqpH/RKo2zAeYFFEeoeDlaeYZBTWcv3M
 K2ay4rIHhHnCfKtH1i5TBjqpTzrgp1McfL7LXvSTC5imVhI25+5/3UIeP8wNASjjquP4skfL72+
 NUia9As3jFg8dMMQ+5w6RP1StDi6hEog3oj6SzhdOKwXTGhARe9XZe9riAjWd7mlhHKEjkXMu2Z
 afTSkxs4pViZRFkdeynzIP26vDlBQ3cQ8Xm1FykzlEwhgm9/E3lXHPTTxBwMwtuzqohrVfv26Xy
 Ng+i75ceKeeOBzvHjqVhCPQJTrjt6ATvYc8LzIj4Bhz9tF17cfJTrzVJCRHXU78gkUlihnYYd0Q
 Sy3CmViDvGDZNkgzBHOc5gihYP8y52Pzf0/qz5XoOAA4sxEN6+HNRemZefUYzQndh0/u+5MBBTU
 +iOZtI7sAMZGdqu9tng==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69452347 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uA0lw2tLCnOllznBo5kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: hmvPDzgGiUekjVPwjBuzwO11b-M-JYLL
X-Proofpoint-GUID: hmvPDzgGiUekjVPwjBuzwO11b-M-JYLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020457_297497_E2C4F405 
X-CRM114-Status: GOOD (  13.14  )
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

Patchset 1 introduces configuration of the global control register with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 3 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

Chnages in V5:
1. Optimizing the solution to creat sysfs nodes.
2. Optimizing the logic for configuring bits of the global control
   register.
Link to V4 - https://lore.kernel.org/all/20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com/

Changes in V4:
1. Document sysfs nodes with correct kernel version and date.
Link to V3 - https://lore.kernel.org/linux-arm-kernel/20250827105545.7140-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. Optimizing codes according to James's comment.
Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Refactoring the code based on James's comment for optimization.
Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Tao Zhang (3):
      coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
      coresight: tpda: add logic to configure TPDA_SYNCR register
      coresight: tpda: add sysfs node to flush specific port

 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  50 ++++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 194 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpda.h       |  75 +++++++-
 3 files changed, 312 insertions(+), 7 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20251219-add_sysfs_nodes_to_configure_tpda-f54636512817

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


