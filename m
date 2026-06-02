Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8qDpKjFWjzyE3Z+3P3AumxwDBnmuLFClF4s6OPO1Lg=; b=oKzZmjLsVvDa9l0xQgNSeMrvrd
	2wQfzDEJcCO5uiIjMP4+Ytjg9BrNDxt7KnKNFmnuco8wPXQSK63b3NiqjRWlPrkvZxD+QMnVGTHMD
	5OfT0JUtC82S7CtV6BuQIwQJsdej8l6YVwQQvE4hnlxmeIHZ82q0tr+DNLBnV4Z9aADiZ83nn7D5A
	CFlhTLYq4UPDMpTA67SuBZNTaSZqBam4ZtWm4muq1+8mLJGzDQqrNbckns/TRigZ7uC+WIOCkyCNv
	/i4xQTYLfY7heI77PX3C0vyiqAMvJciFP+uK471BVphQQ7eXtOC7ZOaVQQAj8X1HJpJJeOX9UgwRa
	tRzWHbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7h-0000000D6JF-3HNj;
	Tue, 02 Jun 2026 13:25:37 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7f-0000000D6Ft-2YMY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:25:36 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524Zqfd1259298;
	Tue, 2 Jun 2026 13:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=w8qDpKjFWjzyE3Z+3P3AumxwDBnmuL
	FClF4s6OPO1Lg=; b=S4D4mFDrJ+YVkouLu1QaOcwlr97q412sHaGk9z2BZTfz8n
	xvnoRSGxAhVdlU4NlUXFvgMgr1mw3zyhNRb5hBZuA4qzc/vHHsFBDXCjaDL8PDwF
	fMlhGZA+kdxjDvsey5KGycUVDIGwknrJKtyyECDo9N4PGyK+HEBu4WtCUtRKMQZA
	Yz3TVvKxvNVPFnCLcCZ58aQrdsTBsNJrCw6Oi5RyfhhlPq5AdSO2CCtkFLt18HFj
	o3/6ykLfJ7pxtiVTRedwPLsZ32Mze0EIv0IrOIJ+dDKuVbzSAyMdHp/kqgCwDUsY
	1BOBoWKQ9qjk67c+eCkrQrGrqW7QzKTymHUJViSQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4efqd465b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 13:25:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 652DO9Yr012168;
	Tue, 2 Jun 2026 13:25:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4egbqhba68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 13:25:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 652DPEgt49742098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jun 2026 13:25:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8693D2004E;
	Tue,  2 Jun 2026 13:25:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 599EF20043;
	Tue,  2 Jun 2026 13:25:13 +0000 (GMT)
Received: from localhost (unknown [9.111.42.7])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Jun 2026 13:25:13 +0000 (GMT)
Date: Tue, 2 Jun 2026 15:25:13 +0200
From: Andreas Grapentin <gra@linux.ibm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v1 15/26] s390: Add functions to query arm guest time
Message-ID: <ah7Ul7YwJOFuSMaD@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
 <20260529155601.2927240-16-seiden@linux.ibm.com>
 <ah4G847iT_pPRuQm@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah4G847iT_pPRuQm@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEyNiBTYWx0ZWRfX86Wu1ZkmOeKQ
 hYG8JWBI1P8fvdZHvYX/pHQiKCz9rM3lqGdXGG9paghq44fCz7yUQhjVqfYolMHIDwf+g98FKQC
 Aj3zl8tHOPDyDut2meXADMv9XEP8o0cHJV9sHqdlPN8V3e4+kniE0zovCBryZoE7+gfU+AuHBAZ
 JUSthv+czWchKhL9Jt88DWUW/BIVzCzQg40h0yVLJqGsIYVFvXAQDo3YvD38EgbQabOHiTWV/J6
 yVgiBQm0devrxebNiP+9lTedkSFR0o6kpVKp9GEzKtjkvV3fXu07ZOOdE3KHZERjeOAEAehGtr9
 8kqSFIzLnfopiio7+QlyWXlCKBciORGj0yJyFKyV7AIJW77/zRLy33V2JCyhPCl3TqFT0YDNiCi
 xOMafpg3k3DxCiOnI47Ya2Gt/hTCEFH4IXSNZPjwubArahqtRcGIQrlGQzNFYz+bBNKXTSM9b3X
 MDWYNtr6RC1RzihzigA==
X-Proofpoint-GUID: RQpxdw-KhYBz1s8-_4mzf7xnJNeZoSB_
X-Proofpoint-ORIG-GUID: RQpxdw-KhYBz1s8-_4mzf7xnJNeZoSB_
X-Authority-Analysis: v=2.4 cv=DZknbPtW c=1 sm=1 tr=0 ts=6a1ed9c1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=iZEGHWcCgkw3lVQR3mYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062535_676883_E713224D 
X-CRM114-Status: GOOD (  18.30  )
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

On Jun 01 26, Oliver Upton wrote:
> > Add functions to convert between ARM guest time (LSB0) and s390 host
> > time (MSB0) using new ptff function codes.
> > 
> > Co-developed-by: Nico Boehr <nrb@linux.ibm.com>
> > Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> > ---
> >  arch/s390/include/asm/timex.h | 49 +++++++++++++++++++++++++++++++++++
> >  arch/s390/kernel/time.c       |  1 +
> >  arch/s390/kvm/arm64/arm.c     |  9 ++++++-
> >  3 files changed, 58 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/s390/include/asm/timex.h b/arch/s390/include/asm/timex.h
> > index 49447b40f038..9ec22a28bbda 100644
> > --- a/arch/s390/include/asm/timex.h
> > +++ b/arch/s390/include/asm/timex.h
> > @@ -99,6 +99,8 @@ extern unsigned char ptff_function_mask[16];
> >  #define PTFF_QSI	0x02	/* query steering information */
> >  #define PTFF_QPT	0x03	/* query physical clock */
> >  #define PTFF_QUI	0x04	/* query UTC information */
> > +#define PTFF_QAGTO	0x10	/* query arm guest time offset */
> > +#define PTFF_QAGPT	0x11	/* query arm guest physical time offset */
> 
> Are these analogous to CNTVOFF_EL2 and CNTPOFF_EL2?

They are somewhat related -- we don't have the EL2 counter offset
registers, but we still need to virtualize the guest counters, so
instead we have to maintain the guest counter offset separately.

However, to determine the correct guest counter offset, we are using
these new PTFF function codes to translate between the s390 and arm64
architected counter domains.

Best,
Andreas

