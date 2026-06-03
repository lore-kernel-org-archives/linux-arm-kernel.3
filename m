Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E575CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 00:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npyTF2LAztZXio21Bq8j0RB5zw9LU0pLQvjc7W7RzIc=; b=KHDcifibPzK3qXUsX7YhB/F7pt
	NuVZ0Da7D5XDx7fWj2EWK2FE5BLC8faTcsZCbkxsCTYrIych9qarDDx0W4tIIGQzzw7d4V3IBHgbo
	CnLrocWULvKKIu/LyZkRucvmIQMDmCS/A3YDYVP9d0tctbR+PJ4uvCNErULUefHlXd3IXjCEnN8hM
	rlo1hx8fbHNsSJrUgTXnmLxCOBucyIVFSaOqKbnrBzl64D1PjMYUrDkrNX8gwpad6fKpdZL1F1mXQ
	E2v7+bPnOMXfHqhzfaJumB2aH3x4Y+G8yB+A40GmcbQTlqNSO2eWgcJW5/yDQ3OSstKwgaMntKQC0
	dgmWjPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZsq-0000000E0dp-0Q8s;
	Wed, 03 Jun 2026 00:55:00 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZso-0000000E0dD-0OY3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 00:54:59 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-9156b74006aso186924385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 17:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780448097; x=1781052897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=npyTF2LAztZXio21Bq8j0RB5zw9LU0pLQvjc7W7RzIc=;
        b=VvSMa9J4f9IOzei2m19mY5fLEYwjs912oLyi/ofl0ANlOfw5QmL6C33xLhHV4TOPXu
         e3ItIn75RDEJj/yAOdfcq50TtaOqf8QjHbdeyHmUDAyQtF6L014gN906rwr0cY8jyDED
         /7Nz3173qZ6dygHnSB0N7VRtTPE4TBEsDvu+8ifslRh6Cul/sgudvZ77b5TEmGkdhDsT
         7ngBaY8+LsA61Zwa2MSAa7MCu6IRwswgJe+KO/cbPL4mNHM8BUErHZJ82T+dHi2gbdcr
         c5cQ/mge5C1F2Qjmi4oMQ/QZjE1Xsz8XzHlmhMIL7MUo27kireAN9jnXp2+tIxeY6nAE
         CVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448097; x=1781052897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npyTF2LAztZXio21Bq8j0RB5zw9LU0pLQvjc7W7RzIc=;
        b=PfRXFZrNO+KTWFbMsRs4IJtOGuuL+KhhSmMOPxPK+WzSzhzcXv7EMEp8z5W5cVMNAY
         39iOBcE/+dcB1f6gw7l6pWCViRgi+/vkX1py6XkR3/AUOC4dzzfSy6qJbGn7jN/McNmx
         ZuUu9cNPnCdrLnUWcgRraFhmOczujWVgiaa0btYvlpvWPQpr35hLi01ysgAXhyNzciCP
         cvG5ptXBywq6i6R7vDIqINQUXkh8MC1AhnAkwbwpCw2/xC16jxoQ7WZWhlDM2fAP0Rd9
         7hjzJ28F45Rhvk+8bQpcbqgd01H5LthFlmgz2gUKbowd4cqBzO3LvCxX5L4ztlCY9Twu
         bM2g==
X-Forwarded-Encrypted: i=1; AFNElJ92FYVeAcxJBQKqFkg/78nr+MLVvxmjFuB+hby4h2mh7SelFvKi6i9r5LpsQ2HUm3NNjhGTTJaZAGBVJfrZqtC3@lists.infradead.org
X-Gm-Message-State: AOJu0YzjIZlEG/kFXFgL63ujNJZEkMshGfgHVWrKbsNK7Fmh2qALCS9l
	96ZGQSUJA00/veJRIEKAiMw3GyIdLfJ/NuLN7VVVcoHtaxnfqZkcEg2y5Jd8KRLeIPk=
X-Gm-Gg: Acq92OHVYuYLhlgEJYerf8I9yQ+KxG4IwBA8q82nv1PJLoDC8+glVukLC9VaRcID86X
	GPIhvIZbhtFDwNN2FTsfuWs4JOjdzDCI/Nnloq8uD51vPXWe9nYAf2h3/+DojoRfuK2GkUGhPkV
	Cp2iQXTGJOQfazF3UTI73aK6vFSDHzuLdc+jrthLTc2tnykF/EcWWrzwlosHUpJQRNVaCIXOPk1
	OHqOsUmzn0N8lH0yP9AR9x+teNNiCfjkQ8gbEAYrBasaYkVmun68uKehh0O0JYKJx1Ndp5ifIdt
	8YkXyZOoHGDOltl1vPCi/goxEJe3MtY9vXUFVgxQeNx16JBmdQF8DU+KaNHhju5NRs0FY30leGi
	PAyGmU+cvRchhM2xsaJPEAqiRw16eTR9jxAdBlu3O6rTvYMwM1zCQQUatp3VZfBSErx3XCgYxlk
	6HUszvO7UjHlKBO0svqxZ/iCiSEj4ImFoHL7HWaUSWZDLy4q56aoEmCjxto2URr/Wm9b6QwhivW
	NY3RKyNtsx6jflA
X-Received: by 2002:a05:620a:4409:b0:8d1:a75e:2f8c with SMTP id af79cd13be357-9158a86b6acmr242337785a.53.1780448096650;
        Tue, 02 Jun 2026 17:54:56 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a237330sm100630585a.16.2026.06.02.17.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:54:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUZsk-00000004x1y-3mPP;
	Tue, 02 Jun 2026 21:54:54 -0300
Date: Tue, 2 Jun 2026 21:54:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"x86@kernel.org" <x86@kernel.org>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v5 05/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260603005454.GM2487554@ziepe.ca>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
 <20260522042815.370873-6-aneesh.kumar@kernel.org>
 <SN6PR02MB415754E94A9505C2B9739E4DD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
 <yq5afr35sciu.fsf@kernel.org>
 <SN6PR02MB4157D9955A93244014AB7978D4122@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157D9955A93244014AB7978D4122@SN6PR02MB4157.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_175458_140869_C74921D7 
X-CRM114-Status: GOOD (  11.78  )
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

On Tue, Jun 02, 2026 at 02:24:40PM +0000, Michael Kelley wrote:

> Except that in a normal VM, the "unencrypted" pool attribute does *not*
> describe the state of the memory itself.  In a normal VM, the memory is
> unencrypted, but the "unencrypted" pool attribute is false. That
> contradiction is the essence of my concern.

I would argue no..

When CC is enabled the default state of memory in a Linux environment
is "encrypted". You have to take a special action to "decrypt" it.
 
Thus the default state of memory in a non-CC environment is also
paradoxically "encrypted" too. "decryption" is impossible.

Therefore the "unencrypted" state is a special state that only memory
inside a CC VM can have. A normal VM can never have "unencrypted"
memory at all, so having it be false in the pool is accurate as far as
the APIs go.

un-encrypted = true means "the memory in this pool was transformed with
set_memory_decrypted()" - which is impossible on a normal VM.

Jason

