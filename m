Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17435C71141
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asgOieLRu0diNOiUoZ2jXlR5JV3Qd/n2DC6baSQLRnM=; b=ryElh3dU8a37ZwXmdy/OVPvCZF
	IAVwL4p4yUUowvPVaydeJOBBqWXTpX5uAIR4V77GRcDhppoE+5c8M/1y8isWMEHs1ZqPMcgABK1KY
	Kl4wvSfGId+1fEGuj4MRocbnBAQ5SqpdrgKlNLt7FjKKHPfdrkh2DpXBusiYrb1YGAc0orD9IENE5
	0k3nqiWMg6VFQupEz/AuwxcqrvWghgFADXRu2FaqNZsNusvr6uWR4hjT+sAe7m3DbTUt4gb4uLkt0
	qtVY2j9+7IL1U/jJSjyy2klEh6LXz1Vp4SYlJwEzG4IptL/cTvwV00i14dQYH1E4RbJtMkxMA7AMk
	ygw3iDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQQuL-00000001Ia5-3HMo;
	Sat, 14 Jun 2025 13:26:53 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQQs2-00000001INp-3csq;
	Sat, 14 Jun 2025 13:24:32 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E31XiX026411;
	Sat, 14 Jun 2025 13:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=asgOieLRu0diNOiUoZ2jXlR5JV3Qd/
	n2DC6baSQLRnM=; b=QdpU4ujh2znmTfKyKlX4mmaJKgkxJQP5WltI8RvqMsauCi
	D0xYclDyHiGT5WSF3VwCrWsgu9mx+Eg0IzqdzpXerpUx7hZs+Yk2o7UblXRFax2j
	E4lBEW73KizXX3L+yOZehgIbmcuMcM1BmZ+9rZlxeKvSnGZtVx9vhzjhbsMu6acn
	7zcRehZ0XP+l2W4e+C2M4TZdb8mPhiuelM90U8SdWQNsAlRMZ98qQIBqCqt3eXXF
	KEdwgLK9qyRO7oNWnssXcAXuBM6QGDbbMZMBi/jFx9xxZg/pWkWA4tTo2YaG4B80
	1kfaVdCSM7nE7DIcGUPaYUQwHOzU5f/rqDefmgnQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790tdhky3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 13:24:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55E8akJ8014948;
	Sat, 14 Jun 2025 13:24:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rppu2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 13:24:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55EDOOCX37618074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Jun 2025 13:24:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4276A20043;
	Sat, 14 Jun 2025 13:24:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B75820040;
	Sat, 14 Jun 2025 13:24:23 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.87.143.160])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 14 Jun 2025 13:24:23 +0000 (GMT)
Date: Sat, 14 Jun 2025 15:24:21 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 09/12] lib/crc/s390: migrate s390-optimized CRC code
 into lib/crc/
Message-ID: <aE14BfWQHvki9pW5@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <20250607200454.73587-10-ebiggers@kernel.org>
 <aExLZaoBCg55rZWJ@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <20250613171143.GB1284@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613171143.GB1284@sol>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nj-5Q1qWGKzJpm-8fdR-97xdbrM1_VJ3
X-Proofpoint-GUID: nj-5Q1qWGKzJpm-8fdR-97xdbrM1_VJ3
X-Authority-Analysis: v=2.4 cv=c92rQQ9l c=1 sm=1 tr=0 ts=684d780b cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=fhZMs16YlvXlDsCV5c8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDExMSBTYWx0ZWRfX9VGL3Nt2grmi XR12ZSw6bF5QzEcFwoU9YySQ7ESO7UBTeDWf9VSjgbgnS44V4zwPgmto4OmAvE7t1tkgKOgaEeJ 3KlPppY7dIwK4yNsfAdKeDH+PizbhKm6vQbc3IemUtkRykwmV4G0BRGMhkHA6dhLxnjHFmd6HiP
 L+RgSlaiw/7V+kb0HatOVNVB5PW2cjICh51TUaxD3pR6joEKa4bQfjBYnE3u1XGX98rL0iGK5QM ipnKhdfgzrpC1RV/yKaFvLGo8vJfC7pZB2tJb9BbwcIfChRVLo/5Q0opcEhYKHgkSaKhNTruY7x KV1ti89wPc3jLoJdwJKPmWKTTNqz8wdeqQyvN8sLH2hrdXbz7R9PQSf/sXKqzKXhjKIAewJR+bY
 NdnRQufd/o2KAEOF4Cnd4CKWD8yFSJFxKB+H54xsN950Da/R6flU9XzMmXFw5Rp0t+AS3P91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=853 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_062430_907646_AD754B6C 
X-CRM114-Status: GOOD (  17.46  )
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

On Fri, Jun 13, 2025 at 10:11:43AM -0700, Eric Biggers wrote:
> > Hi Eric,
> > 
> > With this series I am getting on s390:
> > 
> > alg: hash: skipping comparison tests for crc32c-s390 because crc32c-generic is unavailable
> > 
> > Thanks!
> 
> I think that's actually from "crypto/crc32c: register only one shash_alg"
> (https://lore.kernel.org/linux-crypto/20250601224441.778374-3-ebiggers@kernel.org/),
> not the patch you replied to.
> 
> Those self-test warnings are expected.  But I guess they are going to confuse
> people, so we should do something to make them go away.
> 
> I think we should do what I've proposed for SHA-512: stop worrying about setting
> the cra_driver_name to something meaningful (which has never really worked
> anyway), instead just use *-lib, and update crypto/testmgr.c accordingly.
> 
> I'll send out patches that do that.

Thanks, Eric!
Please, ignore my other email - I though I did not send this one.

> - Eric

