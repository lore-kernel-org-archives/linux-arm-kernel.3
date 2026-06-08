Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B521CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lx5/sZHJfsfJ+guaof003PPuTXoIXivzBp1RA0FoL9A=; b=BpJy51LL4+dDQg9uoGZm0W9z78
	w3qMMtCKv67iPOje2wmuI4RbwHfJpQMjJAB2Pi5y2v0VDByB8A+F4ybY6mHhKNR0+jyrhV+D/moKj
	w6UbgQdkQNqjGccgoWhB80Kvc8ZITF9zmsDh+Y4IW+HLe3d5PBn63B3W3JpviejyazNgzpcZGGYKX
	LAOwqUYJRZvheOsJIwb9YxNh0Gbn4oLOlBbOCVIo8D3kAIijHTagK94MyALmoatzM4R9fyG96kg+f
	czF8dFeMnNr5OjCyyVbGtFlm1wZ8sNwJ3zgnr8s7Lxww28+yKmbTLtey8rqNm5tdFfbVIaxsqvyRz
	Jjw7w0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYnC-00000003UNs-1ulV;
	Mon, 08 Jun 2026 12:09:22 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYnA-00000003UNW-0J7s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:09:21 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Lcv9m646062;
	Mon, 8 Jun 2026 12:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lx5/sZ
	HJfsfJ+guaof003PPuTXoIXivzBp1RA0FoL9A=; b=V4N8m0h5gplWYy5nhBBNAu
	LUoWFeZfXih5bkK0YLMJ17hCK1nhLGUXoQGRwC4+4AIORSmLX9GYRINanTQp30ft
	EtcQ27j2ZewQYlYhX8ZaJVxMfN63AIvXFtSDb8shI5/5TP6e3wcgfi5ejzosaPpa
	rkivFm1P2b+Lrt3V9HFRGz6WbJuaqkqSjeVrBl3KkuU+2/2i2zsHb+7ieDyo6o72
	Zs31JwAuwKTsxRf3voi0CWYfvf0ZgGO0fRs1060ngCyap6OAvlvalEmBvh4hl4te
	rO2g81gGjBw16vsmj9ui++xITSru7TqaM6ZdysJEdRt1Pbt33gUmbMyboMwyEmHg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4em9ydy4a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:09:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 658BnguG023861;
	Mon, 8 Jun 2026 12:09:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4emwvpwb1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:09:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 658C8u1R27328966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2026 12:08:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4924620043;
	Mon,  8 Jun 2026 12:08:56 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5E7720040;
	Mon,  8 Jun 2026 12:08:55 +0000 (GMT)
Received: from t14-nrb (unknown [9.111.29.158])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Jun 2026 12:08:55 +0000 (GMT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 14:08:55 +0200
Message-Id: <DJ3NN3DTFU62.CFTF1O1HOP93@linux.ibm.com>
From: "Nico Boehr" <nrb@linux.ibm.com>
To: "Oliver Upton" <oupton@kernel.org>,
        "Andreas Grapentin"
 <gra@linux.ibm.com>
Cc: "Steffen Eiden" <seiden@linux.ibm.com>, <kvm@vger.kernel.org>,
        <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        "Alexander
 Gordeev" <agordeev@linux.ibm.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Christian Borntraeger"
 <borntraeger@linux.ibm.com>,
        "Claudio Imbrenda" <imbrenda@linux.ibm.com>,
        "David Hildenbrand" <david@kernel.org>,
        "Friedrich Welter"
 <fritz@linux.ibm.com>,
        "Gautam Gala" <ggala@linux.ibm.com>,
        "Hariharan
 Mari" <hari55@linux.ibm.com>,
        "Heiko Carstens" <hca@linux.ibm.com>,
        "Hendrik Brueckner" <brueckner@linux.ibm.com>,
        "Ilya Leoshkevich"
 <iii@linux.ibm.com>,
        "Janosch Frank" <frankja@linux.ibm.com>,
        "Joey Gouly"
 <joey.gouly@arm.com>, "Marc Zyngier" <maz@kernel.org>,
        "Nico Boehr"
 <nrb@linux.ibm.com>,
        "Nina Schoetterl-Glausch"
 <oss@nina.schoetterlglausch.eu>,
        "Paolo Bonzini" <pbonzini@redhat.com>,
        "Suzuki K Poulose" <suzuki.poulose@arm.com>,
        "Sven Schnelle"
 <svens@linux.ibm.com>,
        "Ulrich Weigand" <Ulrich.Weigand@de.ibm.com>,
        "Vasily Gorbik" <gor@linux.ibm.com>, "Will Deacon" <will@kernel.org>,
        "Zenghui Yu" <yuzenghui@huawei.com>
Subject: Re: [PATCH v1 15/26] s390: Add functions to query arm guest time
X-Mailer: aerc 0.21.0
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
 <20260529155601.2927240-16-seiden@linux.ibm.com>
 <ah4G847iT_pPRuQm@kernel.org>
 <ah7Ul7YwJOFuSMaD@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
 <ah9MFEq09ISAu9cb@kernel.org>
In-Reply-To: <ah9MFEq09ISAu9cb@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNCBTYWx0ZWRfXwMmg62f7h0sB
 RfcqtOVixT1f4AbtezpbVPnnHvj3LHz2fnYbybT7m/eYsZGA85CY3yxfEoQHIBG5+URxkgly1EO
 zzkIEqD5u0LOyxim1tyw7Lzofi+VcESL2dBXa8V+KQFVYyNWixGCIFyqwHhwLAMjoAkS71njNTw
 4/EI3Zbv+ulFK3ntDnu2eU0/jxOqAYJQ3Sn96KlhGr5NqsF5okkRna7t9fIln2Lk/EMtRMkTJPF
 GxSFXtjqf4I7szJEAUCjecGvE3JBYHS4k0Gs0v1yRqJxFcC8FgMNWI9OnLM7ZQ6BkjGxzoCq2nr
 uV9DJp8ueyMF0Cy8bWaFEvu8QaPYId/X6n2z7Es4/UT5MQZoB6cIEEoV1bT0MAwdZlPNlD4+sbx
 ldAhYFivNU0rghPuUbu/oJOyHTk31LTOcgrcGuIrZiF1VYzEM0yr0JbiXnCw4dA8WgQWDWvtQCt
 g9qCVc5uIR/2K3u7iNQ==
X-Authority-Analysis: v=2.4 cv=QKhYgALL c=1 sm=1 tr=0 ts=6a26b0e0 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=HgQSQ640rxy7bNeMIXcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: huzLH-LR3kW0VDa6TnkgF4yRlFlgHVz1
X-Proofpoint-ORIG-GUID: huzLH-LR3kW0VDa6TnkgF4yRlFlgHVz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_050920_249870_95B2F20D 
X-CRM114-Status: GOOD (  10.87  )
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

On Tue Jun 2, 2026 at 11:33 PM CEST, Oliver Upton wrote:
> I was trying to figure out how these functions
> apply to the virtual and "physical" views of the counter inside the VM.

I think conceptually these functions affect what is returned by
PhysicalCountInt() in ARM pseudocode and thus they apply to both virtual an=
d
"physical" views inside the VM.

