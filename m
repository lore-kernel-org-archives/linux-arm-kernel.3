Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E27E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 01:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDf95d9Uka+UIYv5wGQ9WydOISmAvXQAo6tglVHRDi0=; b=FkKaMhkmzHOWVC6brodT/fupX9
	kSNhYSnEZ0A5v/tlT1l6+bjTFFetzxXPxNGrGuB+ZGkoOOOszaJrt2gXTjdmdYyIT7CP1hgmPpQSe
	Qo/39YVuuZs6RW9JRZPC10Exps1ZTeK1UfleFHLE023s9b6GxLStNw/t8E71XSCAnEdElGlLIcf4q
	0UbyUhlLRertlSUcsh9y8DrbDGwrhbk8uORKRmLX74ZkKkxtaKqxLpP7OP5bJeEcz4+vs8nJiWsJb
	Tod0DeDy9gAGj7qmc2z3f147znzOS60AuoDgL85ntRVdpizLUtcAXypH+MOMMZRgmubgdwaQifbi0
	OfQkPJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLufc-00000002Qg5-065A;
	Fri, 13 Dec 2024 01:40:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLueX-00000002QSW-36dD;
	Fri, 13 Dec 2024 01:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50A5DA40E72;
	Fri, 13 Dec 2024 01:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA84DC4CECE;
	Fri, 13 Dec 2024 01:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734053976;
	bh=z6KasiqXW9OocT/gPdXD8wxFCgxz3hJU5rxa3NS7ujM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NOajGzF7Oghi2j823OVBOAGjMfDE2y8sqhBtABteyi+xNwCVBGrHLGBc4kP8k/ZzS
	 nGpVqOiOxYmCXtpYVq8CDh3d/Emvq9T/1xFLC/6g4wNbedpjpYuIv/cuTxF0CeV0MY
	 ibJbSfQIh1u6+D2zMIFRD+W8TWrIVtCfqGegBRio=
Date: Thu, 12 Dec 2024 17:39:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Kalesh Singh <kaleshsingh@google.com>, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com,
 david@redhat.com, minchan@kernel.org, jyescas@google.com,
 linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
 andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
 leitao@debian.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org, kernel-team@android.com,
 android-mm@google.com
Subject: Re: [PATCH mm-unstable v2 06/16] mm: csky: Introduce
 arch_mmap_hint()
Message-Id: <20241212173934.4dc429716acd4c71a76e15c2@linux-foundation.org>
In-Reply-To: <vc2uhcysgosapznbuookcj5677w43a4kzxbotwqub237ccawww@i3pbqiacdwsx>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
	<20241211232754.1583023-7-kaleshsingh@google.com>
	<vc2uhcysgosapznbuookcj5677w43a4kzxbotwqub237ccawww@i3pbqiacdwsx>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_173937_839237_80F9BF00 
X-CRM114-Status: GOOD (  19.87  )
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

On Thu, 12 Dec 2024 16:40:10 -0500 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> * Kalesh Singh <kaleshsingh@google.com> [241211 18:28]:
> > Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
> > This is a preparatory patch, no functional change is introduced.
> 
> This also looks like it has changed the validation order and potentially
> introduced functional changes?
> 
> All these stem from the same cloned code (sparc32 iirc), but were not
> updated when the cloned code was updated.  This is why I am against
> arch_* code.  We should find a better way to unify the code so that
> there is nothing different.  You seem to have gotten some of the shared
> code together, but some still exists.
> 
> In the addresses, there are upper and lower limits, and sometimes
> "colours".  Could we not just define the upper/lower limits in each arch
> and if colour is used?  Maybe this is complicated with 32/64 handled
> both in the 64 bit code.
> 
> Is there any plan to unite this code further?
> 
> We have had errors for many years in cloned but not updated code.  I
> really wish there was more information in the cover letter on what is
> going on here.  I'd like to try and reduce the arch_ code to, basically
> nothing.
> 
> I was also disappointed that I wasn't Cc'ed because I've spent a lot of
> time in this code and this area.  I am probably the last one to crawl
> through and change any of this.

Thanks, I removed this version of this series from mm-unstable.

