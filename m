Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61939D3901A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 20:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=; b=3JhyLpgFvvYcqT9dwTPjIRLw7m
	FkV9e6ldoZKx3PZMbcImKJmvDgc0bmdy7rn/jbpVKAG5HgUrzRDRX0oQTP+6cxgCSiuYPlFEKGWk/
	1lZMEa3gTXCCdZpqVRG8bG3ZMXF4CN7tXpZMb4mAZdssdpbGhg1SXUvWdByLsff8n80ypeoKAspb6
	Qc652Zk07kcQ3Kvk7TE5vWuYYDQD8wVhuVEQ6rxxkwxxH9H/F5se0NYv0NFppc58vn4sZU5TazSbs
	rIkqVp7wBcJ7I4Ho3hyNoC+PESBSeSTaa686T7mlfY1WndYRckJviqdr7AQ+X4x0sOgbWcjOKFYkQ
	GqdhvhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7ct-0000000AefF-0vG8;
	Wed, 14 Jan 2026 20:37:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7cq-0000000AeeQ-0OR7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 20:37:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EIDnAb3460406
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=; b=CENarPmW+LDu7sLU
	SlMog1LkZ+o93A2F6nGh/TPKxoGKY5YSb2/Y2CIuPQFD+IE6A5xTWltYHLq5VtlH
	po6KZ3rGDbCuODu+VkeOmQiQyhmZHq9E5TdOFMU8W9CSS2PLQE2SVO+E4xZm/cKG
	B2tUlKOrCkcq95Ss/Z5a4QuYAfaDHYrZlL4RncAfnv2DjnZbDpmhGpQkFFVyBXKu
	tTJJc8nZJhJ0Cq53Zfe+05qiJYAeCRwy+iKoQmRHbqhuTEvOLQ8EkkyHkwT/wRmT
	9H6dGLD8gZuyLFTOeowbb2uMT0Rx0nElt4V43dpAbGmgyyI3zws7m0MmOuI+wdti
	1KFj5Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg848df5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:37:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12339e20b66so239970c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768423075; x=1769027875; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=;
        b=LTCkU8XwpUUe9F2fitNHPSh+EsMbAa1Qmb4mGV8pCenaOlPGcLCMhwbiwoUhPHzUZq
         aiIYV47oqiGgoYu4EYZKO8jARSFcvkTOR8w02cfL8XYPZ/j1a5sakjO0wIXy0enk0/eX
         jcvdlFjJXYN01vlDscEXAdLOKpLmLoWYIC7/DWEQIirJz78zGXYrMDL0zGsyC0HvmlsJ
         t8F6IrQ1W8+bjfQ9ZytIp1AlKAt3/aZBDVZjLkGdqCgfhgSLThajuoXw+gQaHh/rKw31
         MZAkHVsw2wRGJbP8hmoILtH2mRoc9nW/49zI/vV5etU6h7GtneW6N9uB8wPHCmrXwjjs
         AgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768423075; x=1769027875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=;
        b=lN7ERN0WZ2Xjfe+pfOJyl8rm8zMdE7ZsVi+qUhFSCgUBxLxDiJhXndQPJbY+I0yCqu
         /tFIW8+p0ipiU34eBn1vAovhfa/eN3dZLIvAFjJh/N5Fpu179new5UYTU+i4wXzBoJJB
         G8W4WiNZzdYcA7rco1ZaVyRhxpfOdu+xc9unXpXluaC2YdAXDgVhZLeMsOAsjXiXNyfF
         9YZLRXd2JTOUugrfyYR8XSiB/hKoydA/q6tgvtJvnvdferrmsWgqZC62EG9fHZ9guoQO
         xuzXipTcuSzN7TgKH9bzjGc9pRnzRCtMuDPg/HRDdOSO/K125DmSFgfjUcVgUZt1L0Sm
         mY3w==
X-Forwarded-Encrypted: i=1; AJvYcCXAfgpJ2QU6pDsUavyRv213d9XawVjO2Sbynsgz4b79KSJ2oT2/aE4+KCZkuvslCTKZ1jLzTZo61WHmNWROr1mv@lists.infradead.org
X-Gm-Message-State: AOJu0YwgZ8hYvFlmuyoBm/w26SZLwJK4euOYJ7VQc+5xtdkZzd7SqSQC
	ZI6/oLtIyascskfRDPNgOf9OYRz5nr51b8LzbpciDu36XVQXhQuYp3APMCk96YkwyRoJzsoBfrp
	5FEGn1tj0D4dxmcUqohQT4swPYm0mjb7+jix2pm82uMpfRaZ6Zr8s0QRa3GU3MCyic9LJLfgskR
	7ZHA==
X-Gm-Gg: AY/fxX5bRqD7X4qNXtf5JBonstUwt80uZtDdR0X1hlz777uxyqK9mpstYDl63Hi040F
	0cafHWubsPDrb0dhbN+ebdOHWlr0+cEH0nydwj6mFOTkXpTvGKagyXeReRuwdwThg9A1qpY4f/m
	QG2DImEQR3YyQ3GBeJgu02iXhF85x/wOWHPX7ClN7PG+ZmPfKd41GI/uBeOf27dcnr/mmQpqsWf
	BSp2nYY+fNFBZhz+N45wtPU8PDF00/qzjnAsirFCWeDEF2te4wIhjLQ1Kf6jIlVBlj9kTvynYGI
	E6IzOYWYoo16mBbhD+KWWLmAIFIlGKOet8/cwFtFGN8AnJxd5WKD042/qCUXWLqen70e6C2QhEP
	76Y2+dRU6gLBOecqF9Y8=
X-Received: by 2002:a05:7022:f8e:b0:11b:9386:826a with SMTP id a92af1059eb24-12336ad6fc6mr4063611c88.47.1768423074367;
        Wed, 14 Jan 2026 12:37:54 -0800 (PST)
X-Received: by 2002:a05:7022:f8e:b0:11b:9386:826a with SMTP id a92af1059eb24-12336ad6fc6mr4063577c88.47.1768423073673;
        Wed, 14 Jan 2026 12:37:53 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f2434abesm31939310c88.4.2026.01.14.12.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:37:53 -0800 (PST)
Date: Wed, 14 Jan 2026 14:37:51 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
Message-ID: <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107162829.416885-3-joaopeixoto@osyx.tech>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OSBTYWx0ZWRfX+/lCOWqv5Umm
 +Xyxvdqp8+5W4W3vv5oZHMLGpQwrOrMyjmVmwV0KUdFmy4DM3a5FrkA3GsvOC4VGKZrnlZW/IHA
 rqcmz6AziUJ3TLno9/O7G8Hoz8IyuE1sidFgp32ggLDcCHPNu68j8FdjCZQ2H7iL/zFGOo6RC/p
 wtQbfvOIPA8H9ddqBgdpYJ2bxygiuDYB0l9uIyI+v2NU831aRE5DD43KRaI/XlTVKS5brYDB3Ej
 AL3URb6zw8UZjW0s0R1srBhEBoKA1qTZ/MQGWPvD3k9dX+8mIYckYBP+NWZby1ae2pH0OZyGj/Y
 xRqPM8qJj1FoytDTqdmLJQ6xBF22pgbk+aVcthtJRs4B7OO85s/6qj5g0dH3q/vxOEBCNI8ZinO
 1mJCuURQoAMSptJ+Upr5yImcTeKrCILQD3nGTZEc7t0TXq3asT7fN6P0lp1zA2OfAYLXEKOqC1F
 jV20+yrG4YUWG/GXQCg==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6967fea3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=8nJEP1OIZ-IA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=U1-EPvYjQXF-sRXeHicA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: SADcB2Rs5IgrwgeB_w5YKAAFjpYBSbzp
X-Proofpoint-ORIG-GUID: SADcB2Rs5IgrwgeB_w5YKAAFjpYBSbzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_123756_128620_B2BCE2E3 
X-CRM114-Status: GOOD (  17.84  )
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

On Wed, Jan 07, 2026 at 04:28:25PM +0000, joaopeixoto@osyx.tech wrote:
...
> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
> new file mode 100644
> index 000000000000..35658f37e1bd
> --- /dev/null
> +++ b/arch/riscv/include/asm/bao.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Bao Hypervisor Hypercall Interface
> + *
> + * Copyright (c) Bao Project and Contributors. All rights reserved.
> + *
> + * Authors:
> + *	João Peixoto <joaopeixoto@osyx.tech>
> + *	José Martins <jose@osyx.tech>
> + *	David Cerdeira <davidmcerdeira@osyx.tech>
> + */
> +
> +#ifndef __ASM_RISCV_BAO_H
> +#define __ASM_RISCV_BAO_H
> +
> +#include <asm/sbi.h>
> +
> +#define BAO_SBI_EXT_ID 0x08000ba0
> +
> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
> +						   unsigned long ipcshmem_id)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
> +			0);

Just let lines like these stick out. We have up to 100 chars and these
types of few-char wraps are the most annoying.

Thanks,
drew

