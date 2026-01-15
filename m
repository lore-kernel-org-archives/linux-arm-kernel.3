Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51A7D4660A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwR0uUolx+3fZ6HBGehtkXZAYeKDCpBOfveblWPYLCY=; b=lndpCeGvhn0AXO4Df2dDjqISr5
	Ttk5waOB2dJS6HJHeMyxEfs4d6/OI9QHrzAZPbJA5s45BL/tW1efSaVm7P0v/uQYdVtR4WB08ogJf
	eLq8kaqyqNCPNyd+XkGOEKXA/6UHeehRXNK9iwEX0dZeb98Qa9dAdGkej7NTUrjL/05/OtT92zAfQ
	/3ew3rMNm7KgFMUV1Z4cJ4CC0+Mkv6dnNFy4Q2KhYnS9Hds5xYb84/GDUTOxEHSHA/lxSTS92Oo5+
	SiXDOyhalPUz5rCYhAY6qDlXh1vGRR1Cbd1nI26zW7kkg/FgLtyy4AsXNBDRQ5zAePz2Z660gNd4X
	kQGp6/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRt1-0000000CwPw-2mHM;
	Thu, 15 Jan 2026 18:15:59 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRst-0000000CwPP-06ke
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:15:54 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60F8HOSs005567;
	Thu, 15 Jan 2026 18:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xwR0uU
	olx+3fZ6HBGehtkXZAYeKDCpBOfveblWPYLCY=; b=lWAwCXWMmOCsBGN6UzBSMR
	ybcOACpaeed1JCD+uEYWrrj/HhQoP02g1G9Bq3VDgzGXXIwZO0aRtdx65ntZpqVR
	lCEmVa9zXo2IGnxkxCNmrJI+WzXo08vUMX0FXCuIevfXQtZNtS7bc0qxG6Cb6im5
	3CLSEcCseOd9LV+SlVTfavdqxN3ezN/vACJ1ICNRwR5COVHOQ+jpCUqSGi9p7CYX
	7qvR1vR3aeJrTmIsr+JtwT01tnTiCZcJNU4wxg24+XUKxP/gesClb8iTvXLyh8dK
	0rF6eHNbMUXm5kZpt1GY7+bcddtG9xuFWgq9dj+R2E1bNeAxb3BApLvTe6Wem2wA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6hfrj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 18:15:03 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60FICmCt026022;
	Thu, 15 Jan 2026 18:15:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6hfrhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 18:15:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FGCDdR031255;
	Thu, 15 Jan 2026 18:15:01 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t21bkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 18:15:01 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FIF0CW35979552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 18:15:00 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94CD85805D;
	Thu, 15 Jan 2026 18:15:00 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D3AA58052;
	Thu, 15 Jan 2026 18:14:58 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.157.243])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 18:14:58 +0000 (GMT)
Message-ID: <f41d4722a70fcf11a617bc740bbeff29904b1508.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
From: Mimi Zohar <zohar@linux.ibm.com>
To: Coiby Xu <coxu@redhat.com>, linux-integrity@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>,
        Roberto Sassu	
 <roberto.sassu@huaweicloud.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman	 <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev	
 <agordeev@linux.ibm.com>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav
 Petkov	 <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)"	 <x86@kernel.org>,
        "H.
 Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel	 <ardb@kernel.org>,
        Roberto
 Sassu <roberto.sassu@huawei.com>,
        Dmitry Kasatkin	
 <dmitry.kasatkin@gmail.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Paul
 Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E.
 Hallyn"	 <serge@hallyn.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"	
 <linux-arm-kernel@lists.infradead.org>,
        open list
 <linux-kernel@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)"	 <linuxppc-dev@lists.ozlabs.org>,
        "open list:S390 ARCHITECTURE"	
 <linux-s390@vger.kernel.org>,
        "open list:EXTENSIBLE FIRMWARE INTERFACE
 (EFI)"	 <linux-efi@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM"	
 <linux-security-module@vger.kernel.org>,
        "open
 list:KEYS/KEYRINGS_INTEGRITY"	 <keyrings@vger.kernel.org>
In-Reply-To: <20260115004328.194142-2-coxu@redhat.com>
References: <20260115004328.194142-1-coxu@redhat.com>
	 <20260115004328.194142-2-coxu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jan 2026 13:14:57 -0500
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9LcAC3ArNRQrB58_TMRchOmHoH0JFiMR
X-Proofpoint-ORIG-GUID: az9-Zrhe7xUtLNs6ch5w8el14qu6fbXh
X-Authority-Analysis: v=2.4 cv=TaibdBQh c=1 sm=1 tr=0 ts=69692ea7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=AiHppB-aAAAA:8 a=20KFwNOVAAAA:8 a=DCsw3ThD87bJHtXWWggA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEzNyBTYWx0ZWRfX5KE9JA8QOFaZ
 QMGylEA2yFrr+LMIlyvxq+GyxaBE3YSEZRlUTijTR0pqOeohHx6Z5o43Ifowv0PwTznHZCpZaps
 P+PFGgHb3M3BpBoqLiGM4S9nK/XYDMeVW3LCMrGOH2JX3h6+U/KGNp5njojjr7Q5jOJhW0IteP5
 zR68vj00G5AtbEN/qAH17efmlAN72EKIlIccQpuQi2Pm5B/93dTxUKju8YVYTIqg3/xbzrzXBhu
 lfwH3mgTVDAixc1ppBso4WX7HbNHhxS95YmrzP5NklBF9YvXXre8NFtZ+HezYe12UcVOPOOauvU
 Dn5D4oCftdI4q321imUwVveAClH6XWJlbZxjs33Mt0P0bMvvZK/TUnM3on0dh1lQEIZzNdcHFg9
 xyEXOo38GSVGnzoy1P+ayCy4GXnXFhQhyK8CpU9JMm5+WZhbRg21HLmjBdG3WhzjvAuQQmuubGp
 eZ3hAvJ+zUyl1kCDipQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601150137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_101551_182962_97970A9A 
X-CRM114-Status: GOOD (  11.29  )
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

On Thu, 2026-01-15 at 08:43 +0800, Coiby Xu wrote:
> EVM and other LSMs need the ability to query the secure boot status of
> the system, without directly calling the IMA arch_ima_get_secureboot
> function. Refactor the secure boot status check into a general,
> integrity-wide function named arch_integrity_get_secureboot.
>=20
> Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> automatically configured by the supported architectures. The existing
> IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> IMA policy based on the refactored secure boot status code.
>=20
> Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> Signed-off-by: Coiby Xu <coxu@redhat.com>

Thanks, Coiby!

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>


