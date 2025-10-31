Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C192ECCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Pr9wEMej3X2o9II7gEPo6cZPBiBkldPgx1QeDQKEGI=; b=Hrks6r9i4VXPPyqjajg2lps1zu
	R52oFsWxzH4vSYjG2FqgGRWLpJKYY13aDk6eIjZCrwb2P9yDVf0WrLchVv8PY8nQHH8VUWXngGmr5
	5EumSaxmIQkF0TJVRXYP9EA+u6E27aabDtxCXlRbjnKVYxETatkFH/UHP0chtvPYM+AdcZAy7qzNC
	lB7Sn1HUI50rqQ8XTUqrfXSeXwJ2j08kwl8V8vzvD1zPfiaIBPe4yXXE7NoCu54w+kjgXNGs0cCo8
	gKqbvBA65SE+WR5VEDGclFHDAwdXsbYQ3jUXeZEVaST0SQk/qe5TosPGhY4SQxF2jN4B3012KFkid
	pwrhidCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn2y-00000005zOV-2ufQ;
	Fri, 31 Oct 2025 11:11:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn2v-00000005zN2-24sh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:11:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8H8kh897530
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7Pr9wEMej3X
	2o9II7gEPo6cZPBiBkldPgx1QeDQKEGI=; b=Yl4gSjhc7vyON3z3rQZJfLHPIG2
	vS7lgDxM925dy+7Gl8MRFRwu5zIDHqkdFAIaUqOI4hP9BG2aUCuGxzBpRuPwE8BS
	FaM6S1UD3HRiOCjue1SAFz39/0nE+P/5G0ckQLUULJibJvWs2VIiqwgAmQiG0aC4
	9mTchwfoPsXudyX5utprBdVfB13fAV0IrODzWTs7+2NkuZbqXdYHXUP8RNnzZ5O4
	gWG1SWIX22D7U2T0VORZYPe98LpcfGid+JjOvlC/TWVZF3cW7LcPMC8JN0gBkJ+S
	/ixef7JIpw6dzjkXA3iVCpfD4XDyRHVUQFeefGsAjqUKVmy6Cgj9yh9wOLA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb21uvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:11:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-798920399a6so3034747b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761909112; x=1762513912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Pr9wEMej3X2o9II7gEPo6cZPBiBkldPgx1QeDQKEGI=;
        b=GEE6ma6Fd+fc8x2WPENexCGPJoZuJUwtV7B3LJ8Sim3giMaB5utnIJFFOU606ZDuQ0
         0F8/Xbk0qoAXkEbGvfDZKj7djckoGg5b3ikELIkqQaVDDJB4Rplr/qP4Uv9SBJ7VrCH9
         O12zPsAAsIrG9G6ESs2L+E86svjsh99e5si8SfywlTzRUS995peaRHD4QreVVxjY0RZX
         LUsv8Jvo9gKPiqhGIrF/NNMe9oGoanHZFWYlkKMZP9DDTMlvjXnZQyLQXqPWV3D/FQXQ
         GLlzGtSV33yszJcaPktJO5Sw0XrsLFbBM3/A4KhQ4x/Jw6vIpDtQKwByTYcXkEbKiuZ0
         jr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909112; x=1762513912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Pr9wEMej3X2o9II7gEPo6cZPBiBkldPgx1QeDQKEGI=;
        b=sUDs9UrWjTZn6qHAg/5qFuU9dWufgeNi5waEBAH+O0XXbUKZ6IMJtBqZbQCF6jgNhd
         ojBS8prMVAX19Xa14o7P3aN7OlTzHMMUM4JpmDB6QYacbPVYtCfSH+fgX6WX4fo2DOBz
         MHYEcFv4VgE/DNNvOswcHhbc8Gp7ozLSPgForkheqI/M0nYNgftkt7liGtMd3SsI4iq3
         x1eZ25v7qSX7Ss7beNO4mB5MfsFxsJdMSL9ylnii5FsebT/E3ZpGeA78WA0ljWUK1pqf
         KfMb+Gre1x3cQpRAdOrfPIXaatkRVKnxelw4/GZQfYxWUqha8LorTbIcrJvff9q5+7eE
         5CKw==
X-Forwarded-Encrypted: i=1; AJvYcCUlLNQUI7ERJNsFz1wGwDu0HsxNYrlR6i7XnfaG33K7Yc+aNqbEtfn4RDvPnrIPvSRfwOCpHz3bIpQMiolAshKx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/iytIA0YKHERRSGKEFcCctc+pUTh6n1mCToHVjKfzNOa/3uKj
	1wjrauJFG0vX7FgBbYwa1kdxgJULzBN2vZOjHa+J5IUOFT9iUlQhS9ImEkq2o0tMm60xdoAc9/u
	KkGDQGlWrDxImmetayQEW7UKEH8GGqcy0BZiuVsy7jhQXK21OSenWVOscgDzoX4WUylzhtt3omF
	ZMuw==
X-Gm-Gg: ASbGncsCfmYDyP545GnEdKnLYvV7WlW0yzRzGrJlBXox8seilyHuAy9W09f5iN3ZVZQ
	irLrRe7h5aDfoNPeJJ0bSUdFlZO4v6mVojaN57H5f5P+5EscJTVNpVdvGKoChPY1wUa/X6h7+6V
	EkgHTmMwQnvN5vsmh2oo/F3s6XnHM0KoAZ3n3oTgJeeU7QE8khgiQYyD0JaHOEQRAvNZGVbvpP9
	JKnXC0MuDnAXT2H71bkaqVimsmSuI3YrPvZnrgL0Angxh1mr2pEcJV5/3w1gY/XSr3SU7YDX66m
	aNoxCxgJS8HkLqm9zuR9IxgQ7ZfwKyfIaVX1fqisMfk8V+r7tn3N/4iYDFWN3PaEkd4gzktCQ52
	aSPpQxgGwRkkNU6CnWZ/YcjCqZoWhbomc4D5fehMI/5wxmcZweRaN
X-Received: by 2002:a05:6a21:339f:b0:2b9:6b0b:66be with SMTP id adf61e73a8af0-348bbd8efdamr4486612637.14.1761909112329;
        Fri, 31 Oct 2025 04:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWLfj2x5i1qCeZnJ9GwmytQhhel2oOQF2WbszwiQBtawm++B3zKJRR7yy6T3mF+lnAgGCuLQ==
X-Received: by 2002:a05:6a21:339f:b0:2b9:6b0b:66be with SMTP id adf61e73a8af0-348bbd8efdamr4486574637.14.1761909111790;
        Fri, 31 Oct 2025 04:11:51 -0700 (PDT)
Received: from hu-punita-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b7e197cdsm1804407a12.4.2025.10.31.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:11:51 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>, chenl311@chinatelecom.cn,
        liuwei09@cestc.cn, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: acpi: Drop message logging SPCR default console
Date: Fri, 31 Oct 2025 11:11:38 +0000
Message-Id: <20251031111138.1262202-3-punit.agrawal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031111138.1262202-1-punit.agrawal@oss.qualcomm.com>
References: <20251031111138.1262202-1-punit.agrawal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=69049979 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7d2iCxtYs5MYwnuMALYA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwMSBTYWx0ZWRfXz15L952BqdIo
 y1gXVVqiNKh4Afraql3khSS45JrV0scRGLhMCwOvhkFyZYAVjGf6rxIuJxzqXkY12Ghbqk7iQKU
 IV27zjJ3rsZ5M5kyjWAIGCfDChM83uTTXjRyQeZiTB5om03DDyrwWp/IwAZziOvlnLtpdx7VVwL
 RkEPmFvQEO6PTolHzl8uGOisf4022aIdGLwsycN99glczL1JbumywmgqY9t+dl977vrXRYLstz2
 vGkA+KjSI2K0SblZIjLemaioMfKsu7mZ6CUi43w/14IDiQMtTAgLfBhpcby2dvSmN+YZne1iijP
 4OsogV21axxM9gx405vCdord+0wvfdxPNbg089/dg9E5+cNYCo8bsDGuZ3wGxZdJsyrnfeeOQFw
 iercgT9I289B6murQTyliB5v//8ipg==
X-Proofpoint-GUID: mMlWDAhrveTxHQozORDSL4z9fR_Ip2s4
X-Proofpoint-ORIG-GUID: mMlWDAhrveTxHQozORDSL4z9fR_Ip2s4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_041153_537429_2C4DD643 
X-CRM114-Status: GOOD (  13.84  )
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

Commit f5a4af3c7527 ("ACPI: Add acpi=nospcr to disable ACPI SPCR as
default console on ARM64") introduced a command line parameter to
prevent using SPCR provided console as default. It also introduced a
message to log this choice.

Drop the message as it is not particularly useful and can be incorrect
in situations where no SPCR is provided by the firmware.

Link: https://lore.kernel.org/all/aQN0YWUYaPYWpgJM@willie-the-truck/
Signed-off-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
---
 arch/arm64/kernel/acpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index fd164e8a35b2..c022c1acb8c7 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -252,8 +252,6 @@ void __init acpi_boot_table_init(void)
 		 */
 		acpi_parse_spcr(earlycon_acpi_spcr_enable,
 			!param_acpi_nospcr);
-		pr_info("Use ACPI SPCR as default console: %s\n",
-				param_acpi_nospcr ? "No" : "Yes");
 
 		if (IS_ENABLED(CONFIG_ACPI_BGRT))
 			acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
-- 
2.34.1


