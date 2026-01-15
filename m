Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAE2D3CCB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFjWdO1Kr7nTH1rvXfR75t9SJ08y/Dca1mE8vULWp3A=; b=jQ8RGYznCDYqF48p/PmC2bNrDs
	2fUYjqdrETvyIigwz9oLr6PaKVCBt14/QGlSMwvhM0Kpesec11V5zi+PPYVKNVck95mvjefLsDynH
	IoovWJuM1yEh+pnCNOauFS0U7EzS2fLSmFQgFd+WivIvCc+OaLqlEgrmSefLoV2cH8cCkuUpigjoP
	de1rFI1qVjEA4/gS2Ds6Nlqx05XQP3oDuI6SPYiMo2YK/V7pvgPFqR/Nw+lW6Dg04JV047gklfG0X
	SFqzkpsH+QwrXbWl1yLJg5sk0jn/a2IGOYSJctLWuqFKcKOk12CLVafBUebgKa9EkxYe9+SvNjPeT
	Wmc7SS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGc8-0000000BpkS-45tU;
	Thu, 15 Jan 2026 06:13:48 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGc6-0000000Bpk5-3vx6;
	Thu, 15 Jan 2026 06:13:48 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60F0GKV4004876;
	Thu, 15 Jan 2026 06:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gFjWdO
	1Kr7nTH1rvXfR75t9SJ08y/Dca1mE8vULWp3A=; b=ifeEmi/XL7ojfXZkMHcjw5
	2XT3BUZIK+ze+KC6Dgtm0PFYhYa5rdZNPSG5rlppZoKqAcfp/tzCSuq5nD5bsr15
	vekI1/9vh208hoezzbOp+AnDzJ85eFOzAsWDkO/GLz2W070bQ5sL1XsfaQfVMPcm
	uyyQSEY8nJiGP4A2kvfsJ293a0IThT44VrmuFMdPhJkX/UJbQ/JPIc6MuptSHm3o
	8wuioXgC1oe0K+rDQi4HP4CW1QbR8Itc1HnfWeI3s4kM8yryz8OtjekqyCl9yOQS
	yPhckJj60F+C+R44/GrM1TeqYYAm1Sdgo6xtwsVZOwfZTtbIaRwuuGJenKr+DvsQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedt4mck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 06:13:36 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60F64Wro029529;
	Thu, 15 Jan 2026 06:13:36 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedt4mcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 06:13:35 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60F4icPp030146;
	Thu, 15 Jan 2026 06:13:35 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3ajx75t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 06:13:35 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60F6DF1Y11207328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 06:13:15 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DAA15805A;
	Thu, 15 Jan 2026 06:13:33 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDC9E5803F;
	Thu, 15 Jan 2026 06:13:27 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 06:13:27 +0000 (GMT)
Message-ID: <cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Pasha Tatashin
	 <pasha.tatashin@soleen.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        Andrew Morton	
 <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
        Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org,
        Nicholas Miehlbradt
 <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy	 <sweettea-kernel@dorminy.me>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan
 <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date: Thu, 15 Jan 2026 17:13:26 +1100
In-Reply-To: <b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
	 <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
	 <bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
	 <b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAzNSBTYWx0ZWRfX53I7DiMu6h3z
 raXZ/+frnSM8CMCW6s6EycApm3s6hEGJYKo4nVxjhzW2dpvC/SLuvXwOt2bFBxnDU2o8HyeArEP
 KgqH3dyQwLP6m+aU6EMMPgT7xOMlk4XQygjZ3zRSFtE5O3/2hzrHiyzeLjD6xCJngU5YVP1Y2DT
 M4oOYAvD+GbWzvH+yn69QZZex6VaPw03MenupSF6+0KKMyiJMfTGamOtrUz5U5OeL4yE7ACOpax
 1V8Bm9LBMmtQsGTbCTGGGhgIOoJlbp/8o+p+pCMkCtiFQ4KW0rqOTgOdVYjIRjzAS2GCYw4Xb2T
 dYscTh1Jr06MtPwi5UgOTV/7Za1UdB4jl0ciUkhgXmHH2jej+be2xLWsydOaEreH/y8qTjgm1Hd
 6XW+9NYpu5bD/aXhf59z6H/VZnDjoETDJhvhkp2Y6kFxg5AC1B5HfLqjKMyh6ewlpPtTA2XNRZp
 JF93iBCdf7rwfjpdlhg==
X-Proofpoint-GUID: fME1BWB4YoztfUCI-TzSeij8lia_ZbwX
X-Authority-Analysis: v=2.4 cv=WLJyn3sR c=1 sm=1 tr=0 ts=69688590 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=U6BpzXCMtsgkVx3qoqkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: e7mbieSo6rWsEOFCa9zukzvR3P93ImOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601150035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_221347_097423_98E5EC5E 
X-CRM114-Status: UNSURE (   9.30  )
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

On Wed, 2026-01-14 at 10:34 +0100, Christophe Leroy (CS GROUP) wrote:
> What is the merge plan ? I see all powerpc commits are acked by Maddy,=
=20
> will the series be merged by Andrew into the mm tree ?

This is what I was expecting - this revision is rebased on mm-new as it sto=
od
around when I sent it.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

