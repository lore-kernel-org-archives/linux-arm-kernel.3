Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D8D31A0E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 05:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBim/v7LOH7y0gD3OF5xZ1YGJw09ZKE2NccN2ZAeYfc=; b=B5LoHGmNfdbemKphJyfAxNuuoH
	F0y0IHifo/mwz3udtrxTycirFJAHlwyx6msLD0XpBwIEEs3xTaIWOhz8KPjK/nJXYRwmDw2nwH9G8
	8WjqyJj9fqAN8j1NM97WUL0AbpEj3R94c2TJuWBUMFCn9pn+UYYyhwUSIAn49dMNXQGnFAgxJCxcC
	yRLF+0PjaNFgYThMskrTwBGxh1N8IqcsyAjEpuuyJuJl14gv+8LssZntW1Q/PZ6sDVBziTWh1qIsS
	GVSgBGTOHOpJKyCAbLjRmN7S9Wm6RNo4f17scnbud50ViEcrz1ujovqcTcuw4P83UYGBifsXxsLCf
	ikQ1iToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vft0R-000000084dk-01ZT;
	Wed, 14 Jan 2026 05:01:19 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vft0K-000000084d7-2Qp9;
	Wed, 14 Jan 2026 05:01:14 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60DMsvmY023555;
	Wed, 14 Jan 2026 05:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JBim/v
	7LOH7y0gD3OF5xZ1YGJw09ZKE2NccN2ZAeYfc=; b=crMfuWlLB1BWWRxg1gj4Oc
	WrVeEVGL0VXcAgTqRDObMghchQHjKU/s9tSnEr1R/3NHTMTL5/5+vyIKXZQTCtD2
	fRbykAGfNG4oTgNQ7jpB7V9ymCjnXufD1oML3L3ZJxuEOhi74Beb0okI6aKdQ+40
	nsT6BNY6vuj15Wkq59MGLXMac1lMivC1qlQGJX/vjNnOxrtTOe4dId2ogsU2Y4fW
	Eef+Hil3EM4r1WkR8rs+6qKTWiMs3PvRSTQIMw9QX8DkxXutlrtl9WInSVKZOPTZ
	j+m2TEQ/dwMpDx5uDt7Acz6huz9KKGqggk05EuHUdBUCHgZy91uUQb17EUEn5vdQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6e7f1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 05:00:57 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60E4vERe028834;
	Wed, 14 Jan 2026 05:00:56 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6e7f13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 05:00:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60E1kIJ7002505;
	Wed, 14 Jan 2026 05:00:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm13sref5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 05:00:55 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60E50rVn62849426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 05:00:54 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFC3958064;
	Wed, 14 Jan 2026 05:00:53 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 891505803F;
	Wed, 14 Jan 2026 05:00:48 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 05:00:48 +0000 (GMT)
Message-ID: <bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        Andrew Morton	
 <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Alexandre Ghiti	 <alex@ghiti.fr>, x86@kernel.org,
        Nicholas Miehlbradt <nicholas@linux.ibm.com>,
        Sweet Tea
 Dorminy <sweettea-kernel@dorminy.me>,
        Andrew Donnellan
 <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan	 <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date: Wed, 14 Jan 2026 16:00:46 +1100
In-Reply-To: <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
	 <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D29tMI6bH5gyA6HysOSYI_bS916ORpCJ
X-Authority-Analysis: v=2.4 cv=LLxrgZW9 c=1 sm=1 tr=0 ts=69672309 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=GVBHeeZ94gNsKoPlMCcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAzNCBTYWx0ZWRfX0Vkb7HNvEaQa
 hy2cDyWGDGhXh35qOYGM3Zm3zYME5RTxV2lNCbHr3RQjpwgSUVPhgnqztBE+yoyMoGt10W+Nva5
 U0RMB6L1iXffAZM2sFQ4LqX4IWMRqsutyZ4hR4RtZNwG4iRi27J+Y5GtPrd9xSnsIApJGer4o2T
 5PYCPl0+cl8kZC/0Ea9uc1Ys89wXY8PaCJ9bGHUeU+qIh7DvPra/og3+p2S+0/4uYAmgSE0hCDn
 rg6dbydLCEbJFfN9kMQghGehdVtKNFfrUQPoBn4sQxrWZ8JYsHZDmLztby+guTX1CmEDJztms9P
 HQrUQo2/XtJxrHTeUEGzEtZbRGK+BeSC1tr+tyXL7FANaDN7juC9E/bVvkAnvI+kWRhXRIYk0gU
 /MO2Zojy92eITze9WZfePkxusI/wuDFE0cBFvQIHLhf7AB+uaiNmimawcPyOql+gLaMK1itArx2
 jBhMBavy9xYz/yRduaw==
X-Proofpoint-ORIG-GUID: Ir1PwfNOTcS2nyXFoa-xZGG9lRuyv2Ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601140034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_210112_764136_A4AE33D5 
X-CRM114-Status: GOOD (  12.43  )
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

On Thu, 2025-12-18 at 12:55 -0500, Pasha Tatashin wrote:
> Thank you. This series looks good to me.

Thanks for the review!

Maddy, Christophe: any further comments from the PPC side?

Do we think we can get this in in the current cycle? My last day at IBM is =
this
Friday, if a further respin is needed then Srish will need to handle it as =
I
don't have any access to powerpc hardware outside of work (happy to provide=
 what
help I can from the outside though).

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

