Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6396BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okFdoIS6XfSDlDB0pniyw0cE1iD4IxLcZ4kFa7I2rqw=; b=nEbMx6K4anUuKLj0dXwZeyi285
	gQvwMmT1JXFtXwgHg6g9H5mU5YyMYQ9dPP/3DbgeXTlOz14kgprQNYhdWQKj4Aj3LZUxbbo0kz2DR
	Y/3Y4QmGNzgVlbMtuizFi4MrGtMdgt+swgI8gDwFZBGhiqBy4rH0FHU8RjiCT8PIuwDPCfRp7FYoC
	v02nUZdt43vpRKwp2p45OZK1iXD3Jh03+Sxu3Ly3Qp/bz0Pwjh0nlK/3IEHgU9P5kbXU/fvD99JaA
	SJzVyoZwox8102neLjA1+oM7yhAsBUfYPgJCWRG4XDsexMv1fgZRkCYhyYd2I+POi/1TQKdTkzYT/
	bZ9DcJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDkV-0000000Gnrw-3bUe;
	Wed, 12 Aug 2026 18:32:23 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDkT-0000000GnrR-1Ge1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 18:32:22 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CH1a7T3994381;
	Wed, 12 Aug 2026 18:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=okFdoI
	S6XfSDlDB0pniyw0cE1iD4IxLcZ4kFa7I2rqw=; b=En+T51bOZbP0Qd1B7JlRin
	yh7LcbUVlRIh5KT8JTatMTQr7te5HmB/kmCB27dh5+ORgJ+CiCnzErtbWhh6ZjwV
	5Ptme75FDRls1N+NmI+A55b3+eKWMcvWtj8tcRQAfVTqcoxI2BIomzcXmeQTv4J0
	LELCtYjIlagSEIrILya1AMFMLfl7cE5ISy9C7i3mb6kLeFHXY0F1Cl/R5Ca/YQHN
	UpPmcwHJwkqVbpKrvjwM+AsCr+YRuhY5JqfJyPra1ZzHqUJ1G68Oyg5sNsr/RAnx
	VO15EhmSegr6k5DmqgrBwkc3TowtUoUpd7N8wEqLejWNnMQnypn5kpL4Fq5rXtwQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvp336bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 18:32:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CIQLRh013188;
	Wed, 12 Aug 2026 18:32:07 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxesq7k28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 18:32:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CIW3uR32178558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 18:32:03 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C0B520049;
	Wed, 12 Aug 2026 18:32:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EDF220040;
	Wed, 12 Aug 2026 18:32:02 +0000 (GMT)
Received: from [9.87.128.143] (unknown [9.87.128.143])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 18:32:02 +0000 (GMT)
Message-ID: <724c04bd-f725-4409-82e5-94a63a1900f9@linux.ibm.com>
Date: Wed, 12 Aug 2026 20:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/33] KVM: s390: Move s390 kvm code into a
 subdirectory
To: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter
 <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik
 <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
 <20260812153631.3376090-17-seiden@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20260812153631.3376090-17-seiden@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AMtp2X5w c=1 sm=1 tr=0 ts=6a7cbc28 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=EQfAt2u_B7ro7Q8_flIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZPB-Rpz1g85S4Jmrnn_4co1oTvG4phtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0OSBTYWx0ZWRfXyGHWSaRDCrf4
 AZp0vtL1TrYNuvchrUO9tbOWFZokEWvcXW1WlQlvj737oRFfV1VVv1YOFS3g/Jhnuk4clCWRy9s
 REcnCY5k74pB+mCfC4kQV3YL+dUYTHR+sL2EsWYkuNTZyiUa6vsXWIF8txLU9YA+PF2tZYGBtGc
 LoMNsClAGHe2za4mt9FuKbQBXRjrztYhP0uVKPDlTK1nTMQdfBTx/cAV6CGnAOnnU70VBrHjVaL
 PMb+4pnzJ9+I4Z+z3e2cPlWNwWFEJfGjBUWQJ27n7Ft5tWgM5Rx294v4Qi1C191St6wwEZ3nJ4d
 syw1uUDSwsbv+5Oj4hlwUZYg1hMZh6DkYefRXzKMczdhC6W07EDIzqH3HHMDMpfotJpRLe1j7TQ
 Vv0F3eUKa1gx5va7E/+Tg1zTseACdrOgxQlJG30vPKQVtkIKV0TWuz+eeZe8eCPmcQYsqMDTXjo
 KYplnBrkSvK4/0Bzyfg==
X-Proofpoint-ORIG-GUID: OjY3KTKN4jMyaBFleawkpmY6CEwNrlvP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0OSBTYWx0ZWRfX8Ad9dcnOPQdH
 W50K+MUu6F0m/J7zH0FtDcdiHHIfWKyUNz5o3Wpi4QssWiCiboVUpu7wgFfggFGq1ANOjAtg6IU
 2TPEJqNmX4uzkYoVJLEqFod8yrIbsyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_113221_460732_750C7C62 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Am 12.08.26 um 17:36 schrieb Steffen Eiden:
> Move all the code required to run s390 KVM guests on s390 to a s390
> subdirectory. Move gmap related code into a gmap directory to later
> share gmap code between KVM implementations.
> 
> Update S390 VFIO-PCI MAINTAINERS filepath.
> 
> No functional change.
> 
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>



