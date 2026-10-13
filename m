Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FE1CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjs5mgAwZ0u2tQzKKe+zpfzq8m52SdrPDCcsqsEdmIg=; b=gLGITGQRzkDQyeNDrNUWsqI/LM
	jA4BiH3Oh7HeaLnKl58S5Bd1pDxbNbYtliZ9YKk8BsrnZhCPSR3uD1hNmEl/QpS1IuXss7Hyk+8DX
	Y27xeM6X0/n07yTzCEAJP6xAHnCDLMW9AhbuqC5nlsnVSM3A84Hr5+24cAH2lhvuqV5rVbVtZwvTq
	5MfSFskc57wKf8lKccZK10NhrN3v7z4VcvvNJFLPBXMSkCoygKMe8rMqtbEFe88zuGX5Lr+BKfl+N
	oatiyP7vUzoOt9eHmrwkXRV8B9SraT9iv31kQacDttscjKDPN6SnuqcZkiNYxYMzlKuT0o5SpaaTa
	XDCRHy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXHf-0000000CFzc-3FtH;
	Tue, 13 Oct 2026 07:50:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXHd-0000000CFzE-3VTB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 07:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sjs5mgAwZ0u2tQzKKe+zpfzq8m52SdrPDCcsqsEdmIg=; b=pdImR8erNT6D3YU8dZrhxCZEGa
	KfcvijR5HMcWMKOtANNzzq4Hv0URItHz1ZixK6dlpHJxzz0xWgqUVxY5kesDrWAspAMyRXkYq+B3v
	Oa+jGtOHAAr92GuIqHyEJGoXkLDWAuvDtfZ6a7vjY2auZ9WbgRq8VetuBz44r7hojg2A1GTwid1vJ
	2Y9PfQOc9iKnJE6CU+BlGC64wS4QCUGyn43xkcuympSKXdV5SOMhLww9zeQyQqpTCglrXw4ClTpYs
	UldpoKtM0KdjxxPikU91v7Wu6o9RN6GLcnSF8Pio6daEZCjjEhRM923iIESt5O5ic9yOxL0TnvKVP
	IZYVBPWw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGXHZ-0000000FDdo-1a3P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:50:47 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D2F4BD1933761;
	Tue, 13 Oct 2026 07:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Sjs5mgAwZ0u2tQzKKe+zpfzq8m52Sd
	rPDCcsqsEdmIg=; b=MTJD1DH3K509Y3CM40iggEGEh1FNGlOnHsHyS6xobIkPUB
	iWwogBwHl7a6rhTh4GGI1qsr7OdvVL+9SGl38P8RX6vTcPLSrGTajuxn4meC/jI7
	NqRS7BWskBB2BnN40kEHpoo924Ni9lJbq8+2vmWR/GtzgyDRGgkrbSprGP5QavNc
	K0YXAA0WKwRt3fp2u9tccOlvzqgOfVVDj3oGNUUH95qgEhS1iYnnOg3NMmyuUyZF
	z3xziv1e+hNrinpTP2b8bMqaMW8ZJXal2z9Fx5Uff7J2W1/btu+XjXA/rCbFY/9t
	2LBhpmYPYD8dmQJo8JescP2vRDCGbzY5REbo7oDQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7e1w4cpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 07:50:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7UVgH2297907;
	Tue, 13 Oct 2026 07:50:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h82cygfvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 07:50:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69D7oJ1A43123064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Oct 2026 07:50:19 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BABC2004D;
	Tue, 13 Oct 2026 07:50:19 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FAB420040;
	Tue, 13 Oct 2026 07:50:18 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 13 Oct 2026 07:50:18 +0000 (GMT)
Date: Tue, 13 Oct 2026 09:50:17 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v9 02/24] KVM: Move architecture capability Kconfigs to
 header defines
Message-ID: <20261013075017.696560-A-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
 <20260930173441.66762-3-seiden@linux.ibm.com>
 <26b2c514-de23-4c70-81c8-875f8e8c094a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26b2c514-de23-4c70-81c8-875f8e8c094a@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMCBTYWx0ZWRfXyw5R7W3K3BrL
 LZS0Mygj1AmZeZcOQIxEbDCCTSV4YFnb+GKWecnNfkUmq8HHze6IZ3FC6JyEWjkgK/9ULemrzr4
 h1p8WEQGtHlHPTaqpAYsPkasUz9/rdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMCBTYWx0ZWRfX+r51WcVgennW
 1W5+Csfo13ax9IUXhhZDpqG3+qQTSbWxgs0E+z1KGhGCAwQl8QpaQjD5akVGj2QHYo5w9hgan+z
 0AKFKcE0yUv12a9dBfnmFMDshMhB38S3L8wWxivkvit2xvOmXqopiNZ/M5OsfZ12Rfn2cvF9Rik
 blDH9L6pdeQeE+k2gV7uSDaz8J7L5Qs/z/nJ+mp2K8eKDgfljuw0IO3PSWx/8vna76dJvxvl0kl
 5m7vjOtfXAI32BhTBhXxYHd0f6CV4L3oM/GK2Uvl9fU/tze9zgu8RRLxlkDYynI/ItlY92oKjml
 4L41SFPnBUqqgsnztOzmbL3BGTJKSS14uwZcj9W2gteqQ4DH5XmPc/ARTQxQGvAMNHpSlxtgUTY
 em45iQ68HXwQKpZB4m/Dusx6odXwsGkVwvBYBZd9fRRVtncyNDwSe7CO2f4UOovxo7YgouQaRHV
 YhAGaYl09ZrmTulXl5w==
X-Authority-Analysis: v=2.4 cv=E6pYNqdl c=1 sm=1 tr=0 ts=6acde2c1 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=LolK8cCbLh9hbZZaMMsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: kRfiUjtPbLtTGxyBHkSxxPdk_XR8hKaj
X-Proofpoint-GUID: 8usMhobHWWRXOQdsRqavwz8LGCbzNUF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_085046_406511_D196D397 
X-CRM114-Status: GOOD (  20.90  )
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

On Mon, Oct 12, 2026 at 07:53:43PM +0200, Paolo Bonzini wrote:
> On 9/30/26 19:34, Steffen Eiden wrote:
> > Historically, KVM feature opt-ins and callbacks were configured globally
> > via Kconfig symbols (CONFIG_HAVE_KVM_* and CONFIG_KVM_*).
> 
> Not all of them - there are many __KVM_HAVE_* symbols already.  In
> particular now there's both KVM_MSI and __KVM_HAVE_MSI/__KVM_HAVE_MSIX (but
> the latter is dead, so I have sent a patch to remove it).
> 
> There are several remaining CONFIG_HAVE_KVM_ARCH_* Kconfig symbols as well.
> That's okay, but it should be noted in the changelog that not all symbols
> were fixed.
> 
> Can you at least quickly provide a v2, that changes all symbols to
> __KVM_HAVE_<function-name> (and when not applicable __KVM_*, for example
> __KVM_HAVE_READONLY_MEM)?  I have already changed KVM_NO_MMIO to
> __KVM_NO_MMIO in kvm/queue.
>

Yes, no problem.

Using this pattern would reintroduce __KVM_HAVE_MSI then, right?
I would create those symbols:

  - __KVM_HAVE_INVALID_WAKEUPS 		(formerly KVM_INVALID_WAKEUPS)
  - __KVM_HAVE_MSI			(formerly HAVE_KVM_MSI)
  - __KVM_HAVE_NO_POLL			(formerly HAVE_KVM_NO_POLL)
  - __KVM_HAVE_READONLY_MEM		(formerly HAVE_KVM_READONLY_MEM)
  - __KVM_HAVE_VCPU_RUN_PID_CHANGE	(formerly HAVE_KVM_VCPU_RUN_PID_CHANGE)

OK?

	Steffen
> Thanks,
> 
> Paolo
> 
> > Replace these global Kconfig options with architecture-specific opt-in
> > defines in <asm/kvm_host.h> and standardize their naming by dropping the
> > HAVE_ prefix:
> >    - KVM_INVALID_WAKEUPS
> >    - KVM_MSI			(formerly HAVE_KVM_MSI)
> >    - KVM_NO_POLL			(formerly HAVE_KVM_NO_POLL)
> >    - KVM_READONLY_MEM		(formerly HAVE_KVM_READONLY_MEM)
> >    - KVM_VCPU_RUN_PID_CHANGE	(formerly HAVE_KVM_VCPU_RUN_PID_CHANGE)
> > 
> > This allows each architecture and guest implementation to configure its
> > supported capabilities independently in its kvm_host header and eliminates
> > unnecessary fallback stubs across different KVM targets.
> > 
> > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>


