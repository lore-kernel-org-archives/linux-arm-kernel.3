Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9A9C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg7P5WsXCOzHmfh+hsg5xbi6IkMZi823F1yoqXSLszw=; b=0JyZo9NTXtO6GsRkaOHhwJpfLZ
	ByFD2KRVB74AE/kLTak+8rFDY0YzK6iJrD+YJHYkBuvp9AzVyeJc+CMCok2BLDAnYSVD0Ssevv1Y/
	oV8N5djnaTbNvN7OfGt3DQi0NtWPDvj1gO0UOJMnYIlCb8YL6tfnz/PJP4UkfgojZAYyeT/HVIhXQ
	+8pFCdI0AYYeU/Yx8B71tjtJZ1DfOFcvS3dKyYqpm0zB4ni5W/8/GaGyRPA0ys30aBeZ+XMb87xql
	D+Bbzqv+VqnrAEizVLzBaoqhIjlQJx3frQdUlD9urjeBTTdAa9ZZh5ypiffaybdttyKvLoUgrq24X
	WhFpIaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTax-00000000Y4q-370f;
	Thu, 13 Aug 2026 11:27:35 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTav-00000000Y4T-2MO0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:27:34 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D992U71820708;
	Thu, 13 Aug 2026 11:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=mg7P5W
	sXCOzHmfh+hsg5xbi6IkMZi823F1yoqXSLszw=; b=ss2wDRbKe6cAcWjKlykf/Z
	9Z7+52ixIM5YdF4DX8vFilB5rIeU7XihBeaCICQN/QSWvUXlZWPWcWWN7DZffdMm
	gn7JkSegJjUttRW4dTVuuLPEupSdCnsJiZ9DcTNjvpUaKOEGoeiSS6vg4VJmV9W8
	N/V4FQleydb4KXEqwSI+JQnjzZ5OVy4EHaFlb/2Oci9HGUfDfuim505+stjEzWXt
	oAeoBziF4Lfh7px/HSn/j753BX+3mVb6ddmsMIMS0JtW3X6cIGny0kmuOzh3uxG7
	2MT5K93XVNfnUARxSx3D/T3NzsoH9RVBi+GOT5bhnTAHOAGQ5yoy+6y7RElaLdjA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvp36mct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 11:27:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67DBQmae014472;
	Thu, 13 Aug 2026 11:27:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxh0gjne0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 11:27:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67DBRFpA51380728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Aug 2026 11:27:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1B4F20043;
	Thu, 13 Aug 2026 11:27:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 381A720040;
	Thu, 13 Aug 2026 11:27:15 +0000 (GMT)
Received: from [9.224.77.173] (unknown [9.224.77.173])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Aug 2026 11:27:15 +0000 (GMT)
Message-ID: <b91acaef-f82c-455e-8b02-6eaea7e1f4f9@linux.ibm.com>
Date: Thu, 13 Aug 2026 13:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/33] KVM: s390: Introduce arm64 KVM
To: Marc Zyngier <maz@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
        Nico Boehr <nrb@linux.ibm.com>,
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
 <867blu1ecv.wl-maz@kernel.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <867blu1ecv.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AMtp2X5w c=1 sm=1 tr=0 ts=6a7daa19 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=b1A7PHJKwOOjf_JuNJkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zMBoPD5SC923-_QfaxeXCs-q1IKN7f7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA3NyBTYWx0ZWRfXyMGgs+XRx/8e
 UwEsRJlppKGx0euHj10QxfLn55x6nwDbFXqKAQ14XSRFuZoCehEM8DCe4d5F+KJ2+hJn1xUqep0
 PS11MeDzBzauI4vKyR2c4cgmrvxAHU/8IpiHQJ2BytWyyzPGKjCrjfsU1Az2TOrurU+ed1Fg1ha
 K9sTWE0haH6eLD2dQie3TrY4vdO7XAVJfBcYjnHF4NncqmwXSOwh3QFSj6t47IHTQ+Kw763YLY3
 fSi9E1ZMV7urHwyo/GH21hlZmsvu0yfpH66ZA0s2vLzwyKNDnEvhplDucbDyvqkQl5y1CvzcIxX
 TEPezRVsXvhHQPs9+AqCShe7ZtUKba/mBqN1Pnwzh54lpN3JRwy519DYhrqEjtHrJJhoO3v7hL6
 fCXZWlnaCYASdeYlNHOAShmDJ3CLrJFS1vOrO0XgNi44m0K3XduMq5DI5QibyRIsIP6fgVMSc9k
 jYfd+CyB9J6NRjWsbzA==
X-Proofpoint-ORIG-GUID: YBJx0nVdiloQFoRHZEOu5X1RtnVPgUG3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA3NyBTYWx0ZWRfX4j0qn2/Z+1Co
 sJUJn7YLl413mGTOREkg+qaF8kL0krJU3HcrLtV8HxFYwwHGfurRhSplNrwMYN1/Rti4jlZTsop
 g8JNIcFQ3eesXN+9XjVonNwHZ1OxUTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_042733_729136_3A1087AD 
X-CRM114-Status: GOOD (  13.20  )
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



Am 13.08.26 um 12:53 schrieb Marc Zyngier:
> On Wed, 12 Aug 2026 16:35:56 +0100,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
>>
>> Introduce arm-on-s390. Enable KVM-accelerated ARM CPU virtualisation on s390.
> 
> [...]
> 
>> Based on next-20260811.
> 
> Please don't do that. -next isn't a reliable base for *anything*. For
> all I know, half of what's in -next is broken and will never be
> merged. This makes the whole thing untestable.

that was my fault since I asked Steffen for that as I wanted to have the s390
move clean on top of kvms390/next + s390/next.
We will switch to -rc release tags in the future.

Sorry for the trouble.

