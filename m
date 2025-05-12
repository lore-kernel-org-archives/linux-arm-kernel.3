Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE747C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HZBneFh885hFHtK+mIFsmXRT5LG1VxJtuXyYUQ6Rvg=; b=FB78cPYl2BQkCJd6brkHH5q/Rn
	7zn9MxBbbQNHRP/e8vUQROJ8MDT5P+CHBfdEXXp7ZnVknibT4wdo8I3gleONP4Z/iv+9Cum0S5FjZ
	t2QP0BcKzA21c6k0DQuOwjxbw17aVqKYzi8MRJbaLe6x+a6g6+4YhrLBWp17F+qQSDbTS0XpINj46
	koFfZaIWryabbT99v51D4z4Is0yyirT+3uR7Fa/aiJ/Fpi2m16PW8t0mdiEMjP/OiO1P6tCliryOI
	Y7Zss7v41cxLjMZKvg7KVlD9Rulp4Wc9YKVzjX19ecH4qI1RJYX8klyPIQNy7RevTDwbox1HyBH6g
	ZVZeosRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMBB-00000008SWg-10js;
	Mon, 12 May 2025 05:58:21 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEM98-00000008SKQ-0KBA;
	Mon, 12 May 2025 05:56:15 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BIsxvG017744;
	Mon, 12 May 2025 05:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/HZBne
	Fh885hFHtK+mIFsmXRT5LG1VxJtuXyYUQ6Rvg=; b=cYZHNKPRQY/5iOvCivKtb2
	dd/VMS1tCZKuOeFJHecJQv/vZU+28Z5p02TtRxWLFQWfgGGcPsDXlnUCEcfcm+vs
	2aSdTYhZOdN/Ih84tmYodBA/joVpfKFRgISh8kKi6G+ke60huL0NnWbCkTmGpdpN
	oGN9MOgiylneV3APiC5UYhNhKkxcnpljNhuEEdzqrJjzWYG7YYHxMJ6srPMI30yd
	SNKWHdZhMkQt+TG0nMtVoij9A025EDcyZX8LmzhfMASCQsAp3ilumrgovw0Dua0U
	sY5ztlhnYSC6vcRAoDfLWWWuu993jRukJBUk5Ri0XvEn/1L4CtlPHsMkjtPn96PA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46k1k6hjt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:55:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54C1YAjE011591;
	Mon, 12 May 2025 05:55:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jku24867-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:55:40 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54C5tbcg54133184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 05:55:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6368E20175;
	Mon, 12 May 2025 05:05:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF62520171;
	Mon, 12 May 2025 05:05:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 05:05:11 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4DBF06057F;
	Mon, 12 May 2025 15:05:08 +1000 (AEST)
Message-ID: <7f40b03a926145e79c060f5a0cfdab829b2a5f1c.camel@linux.ibm.com>
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org,
        maddy@linux.ibm.com
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu
Date: Mon, 12 May 2025 15:04:55 +1000
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dNSmmPZb c=1 sm=1 tr=0 ts=68218d5c cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=VlGTkuFJ5WdtLxIKyCAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BEhtyqcew9NhysJzzJPiJH-Y-nhqpckr
X-Proofpoint-ORIG-GUID: BEhtyqcew9NhysJzzJPiJH-Y-nhqpckr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MiBTYWx0ZWRfXxkgdbtEmf1nz dwd7yYAc5Bva+GTN20ZcaaRJI8dRBGYqlLgSgKVPxDqPaR6nHfb8HftYw/MUT5Pccf9AOHh+lXm Q2he+N8skgs1knm9yr1SAniMXxWCEQptEdIyRFgofwnKH7Nr65r5FhKvJ5t+WWz0934l5Z0tSXx
 tBO9kzHyy+03JWmDebEltQ0cA1lYhj6PZ+L8R4UBJsehl3Zmloz92oOZ/OBmyEFjB2OUUFpK5Rl g1bOX8IeClFPgllsfpqzZToIVTmXeFfH3VYdhTg8VnVAUuJ6hmP2ygvjHKgKEtqVg1as+SRjpS/ 2bL0qEl5fFyE5HechMx2LuOeZwKveA98APYPOmYvGo9/L36yZEqLjdx2r8tmKXFdxVisOTxvYgw
 Wsrx2E6M6AW3YRzLDj4mxn8pJsIydIwqWdGM+L7EnvZyMDNVB1iB4wq/1SVLvacjZ6dPiz1/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=953 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_225614_231335_3F478370 
X-CRM114-Status: GOOD (  15.46  )
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

On Fri, 2025-04-11 at 15:43 +1000, Andrew Donnellan wrote:
> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
>=20
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, separate
> set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented
> mappings.
>=20
> (This series was written by Rohan McLure, who has left IBM and is no
> longer
> working on powerpc.)

Anything more we need to get this merged?

Thanks,
--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

