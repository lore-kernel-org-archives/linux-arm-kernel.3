Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A4DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 02:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LdmklqBZnSUukzci3Q8f9SkI2ZUMbamwVnYi1aOm4jw=; b=c/SAlpkgUcKzxo
	/zq+GZ+E9tO6/E0hLvgCAnGd8+vUiRh+khAfvhnJH9OKiBS+VcmtR1rhwysHRGAjCiTHWLqxXOKL/
	hNCsP8V+1ILWmfeQbx2vTJaQkje89Sh8IVjYhu+lj5kLoPXJZZloy6QtJ4y/pMfM6HqfxxHYorLqF
	Wn6u3PGMGj2G20AXhhVq4tnyahAIEkgPVjL7GEi97HYV+ZNDfKkaK+ABrcK3suUo+KbzHRVxEX/iF
	iIiwgq+IqAE/pnWlL8dmkRPL+9M1UbhtTD4sJnzjujRcVQl1d2lkVLl3sm1AOZo/T5HZZLV1hSOl4
	qNKDiGW/UBHqy5acTQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZ2q-0000000F6DM-22Vk;
	Tue, 28 Oct 2025 02:02:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZ2n-0000000F6Cy-2OVN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 02:02:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RLpb0E2752491
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LdmklqBZnSUukzci3Q8f9S
	kI2ZUMbamwVnYi1aOm4jw=; b=QBEguiU5sS38RtfWnoMRT6NLYWdHrPbgPx5skc
	1GAG31s00tYEw4AZQrwJ7lKRAFiypG3wsqWo/yd43WXjCMvMgbJEbgvR9wpMNVC0
	sNvY6wccHBRSaA61h9cPSYJ77JFhDubwhYPPIM24jZW22h2PFZZngTKNeuixl2hk
	+AP9Q/OBJaERTXcPT+mTShNnVCSJQ51MhzHEY43YlXMhQXmfWd0xGJC+wvl0Xlct
	vjLMvHb4EgeJdEZf20SMv/MB5idJLobV7wFFnf41BamTsFNpXUrxv9LC7P2OXPQe
	3v1HCFgZUXJc2CyKoW3rA3hFL2AMo78VSPGJkovR40d0xF3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swj7a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:02:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-286a252bfbfso125356275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 19:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761616959; x=1762221759;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdmklqBZnSUukzci3Q8f9SkI2ZUMbamwVnYi1aOm4jw=;
        b=siFDG/FNQpd2hPpw9Cu2tUetw0O5iZgFBFQUZ5ZOwbCXEUqDLH82I7hkmg2TVamkDb
         tuIWWYY2jJcty+g4gVk/tjuCOo4crUEAZI9whi5s2YKdpUQh4HWpOl0/Fqd8kXcbG2lK
         5ICFWo3+Z3HvAax9r4AP573Kv2J2KWlUUbsB/2pSAwEevRY/DeK7CXy6gahfeD+kkXpr
         dvCM0jkfACm/TXK0HR4gVbQQiz1/e1bJ1cwJAzzvBAsHmq/AYQOLgVfueVergm4/628h
         7Tp2+hSddEyTedcqc3G0WDFR9C3+LJJuxf60KQLjoPBezlo2Fr786uaJWROPpNZMEQRM
         /lCw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ59jUrqzR1I6HLAQSXWk2rj7u1lc794lDdPQgRmSlka6ZydLl1JSJ3Rb8v+ljc+zpkWMVzFLOEwmIiwRLdwLh@lists.infradead.org
X-Gm-Message-State: AOJu0YysJGoJJft4sjJg1/uXpCDMKahIUBqv3wiCe0/XKgrhr/1g/0YJ
	w8AoP9P2Lb+6puTGNdkmBRM8H2/pqwlFjot3blFfEMahjwQiXusv0GUUFWmC9hGb522azn+jlYC
	dhpV3Le0kC+qu6EsRed5xQnkutr5hfkSz/StRQr9CKb4G3FUCTZnfAoaoLxKJV9VQ0tye016i1T
	ksrw==
X-Gm-Gg: ASbGnctfbVvjWxktlcS62eync6H1+ug9mj0K0TeqeqVMZTNFH1QehM5n6OmIazhmQB3
	uUp5paGYVAPlIJY0kcq66LeCEWkXP2LMKsf7M7F6cf5mFLYNwH71SvYx7F82vyCOVHyMJvQLfCl
	Z6RxrFWND6WEfFeufoSRRUx4BuzZ6CuqAx7nM6GTqwspIaU2HMHSPvB1rxMl2JnuW9WxszOvcm8
	dHgzePv598zZrSxS2eTY90I9whVksRQOHJTK9nFZzPzMHXcJLTjZui+7E4+De2Lo7HvcXVjWKQN
	01NLGbuzCK7cQhG9xMoFs53edyt1pXXaI5msb/icUlDTluet2ZJ46ivvDv6qaXPfoH9tH88F2e5
	FUOvn89fNl6M1OgS2+/8OiPKKX0S7Esf8OVhFF9ov82IyTquWV00Or6ehyaove1y+ig==
X-Received: by 2002:a17:903:1106:b0:293:33b:a9b0 with SMTP id d9443c01a7336-294cb507d15mr21024975ad.32.1761616959242;
        Mon, 27 Oct 2025 19:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQLv7Y6Q7LlJX8G4TmUxuMFLXzPFIc/VsgRRICor2MN0xh3ODz7AC5f3H4KtiKDHj57YvB8w==
X-Received: by 2002:a17:903:1106:b0:293:33b:a9b0 with SMTP id d9443c01a7336-294cb507d15mr21024605ad.32.1761616958762;
        Mon, 27 Oct 2025 19:02:38 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2789bsm95861895ad.62.2025.10.27.19.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 19:02:38 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v4 0/3] add sysfs nodes to configure TPDA's registers
Date: Tue, 28 Oct 2025 10:02:14 +0800
Message-Id: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgkAGkC/x3MSwqAMAwA0atI1ha09VevIiJFk5pNlVRFEO9uc
 fkWMw9EFMYIffaA4MWRt5BQ5RnMqwseFS/JoAtdl4Xu1LwFYn8KTse+uEnQKzLGNmRbsq6EFO6
 CxPc/Hcb3/QDhE7sCZAAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761616954; l=1755;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vvKVnKH6htpSz7iLRg1sh/CQNlAK7dhkNwyYH3ZNDeo=;
 b=W3YrNb3jElvv1UmMrfOswBfrlRWpgRigaGB19E3fevLHfe7eAySR8eYSbTKdoRAaj73/ComKp
 rURy7lW8VtwArv6RA8t7fY3lTzuCoMAxMmHHLcFHQ1U/t1gaO+twiWX
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: uGQrqOar-BCDETDWra_eQ99DscMdoAwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAxNyBTYWx0ZWRfXwZGD59FcRwo5
 9uiqj5m4AXf+Fo2IMqKQDhX5Detf9psil/derKM4dNthowzJqHHZwe0FQf9wOte/FVd2Xz88NBu
 Wrcp2D6noJ6GHxYe0W6JIQWiHO59g0eK13hX8eJ38W3Gp6x6qw4mzT7xIwt/MqOsIumpUXQoW9X
 3evR4JgMtxJwW1xK5dNc9YIzMNswB+I4RPNki0HxGvuXqW7dnarDthA2af/65/sj26VmlWaunGz
 ktu6b2LEt1nxFGwKU/MH9eGe9pZR6phZG5UmkaeyztplzF6B/j8zqcQBdX0E9n6+CfySpjSSxi1
 TAOWRhuDk0lIMx1CjReJ+SFlGRr98ZIjCs+gg+4c65Wn8MH6QgubcSinLHpC+cw9UYeA/8N7wTF
 WwdCFqsn00Sb1ZdUJ5xSiBYBUCUH0A==
X-Proofpoint-GUID: uGQrqOar-BCDETDWra_eQ99DscMdoAwb
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=69002440 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=djTE8_U5qf4PL7r0gQ8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_190241_738167_5878A98B 
X-CRM114-Status: GOOD (  13.43  )
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

Patchset 1 introduces configuration of the cross-trigger registers with
appropriate values to enable proper generation of cross-trigger packets.

Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
which determines the frequency of ASYNC packet generation. These packets
assist userspace tools in accurately identifying each valid packet.

Patchset 3 introduces a sysfs node to initiate a flush request for the
specific port, forcing the data to synchronize and be transmitted to the
sink device.

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

 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  50 ++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 278 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  33 ++-
 3 files changed, 360 insertions(+), 1 deletion(-)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20251028-configure_tpda_reg-f3396f97f9a1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


