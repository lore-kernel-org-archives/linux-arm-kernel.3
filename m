Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C88C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OWRyp1Na2XBrlQ7bIW9EaBkPnu+lSJuThzM8dmXiRw=; b=Iw9EZ0+u1kkAwcbR+3wwx8nSoU
	1Vwj40mKn33ogzHQ/fBTTMHzKKVoSVytMxNJzoDd6b/G+34XgCrdwjJk+yBsvI+wFCxT4VKBEd6V5
	7TyX9RDimnQ4BqdFzY8cKoQTygI2CBvuKRQsnFCZ4vW3N6gyMse6B3sqQh3ynTmeJk+hYVhUdb3Ef
	dItBwfTdLxIoNMJS9M6dLUsEiwF8cLN9rxXTJXUuDsFyKzQ2n4BYOJSbH0B3FkTNxq5RpNKUEjc62
	j34TH3MTh1dBJ75I+CnQr/IYTrtuWNFO4MeCaWyBBYj3rI5EgEUdFGI3gU59GvgRdwBC+rG6u1pYO
	9QrrpA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2o5-0000000BcDH-41LK;
	Thu, 20 Aug 2026 13:27:45 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2nz-0000000BcC0-0CsI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:27:40 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-52de50e77ffso5908921cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787232458; x=1787837258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OWRyp1Na2XBrlQ7bIW9EaBkPnu+lSJuThzM8dmXiRw=;
        b=g7U/pr2YUs1Xlx/Q+rxBh5O75kpHv88u7LhVBwImNrOi8omlYuffKUsxq2tk2mztju
         WFag7XdiXXUuCm7OZiskb7UTIZziuW82umO3itlw05dhRSdgjKTdKOlnosoQEFcXfz9T
         rIgups0xtxN6LTKxCE+35YMAqRwGffy0NzzQ1Q3c9gaeri0zUnjJfGBY31/YRUqfh4AS
         wwOU4NuWIJgdw5P4M5BKw5MgGid5otzdrq6+1MlaVrNkimmgsrXinqNytRqS8m0vDB0U
         uXJgztvB3rXxn9tsWD6jR0Kt3CYUkUoW+ihZYRZWMw+Q9680ZSC2YYWZC+DOktj1PnD6
         poSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787232458; x=1787837258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OWRyp1Na2XBrlQ7bIW9EaBkPnu+lSJuThzM8dmXiRw=;
        b=jE/vneiIbQ7CVq4HHQz8RQ+OEwp2/XsF46wROrPFbNLQSypES/PtJZvYV1upE+LYcU
         it4NOMzU12WuB2mHAKihzX/i8JteI1B8k+67Zlw6w7R1574Uz9JoIf9m0ARouI/LFyKb
         V3mDjwyxdEWFBfq8d/+lYkNm5EPK5vL+cGj4CvJJw6PGwJHYZrFr7YCSIUNxV+hN/mYO
         +pMxgbcbvmZSgy/6eGN9gxR1ZayYIHBjPbuBcJgxRf+hemz+nN479NNNUv8esh19SExn
         OpK4F0h+Tc5nbTYXCT02LvEVy0Pao0l2v0USA6i/H1HkJ7rFBTIG3iEzGZ5y2GSlAJoj
         bBuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZPcu4LzVP1rGB92MS8F2R0l9DZEi3RZGxTSc6l+zoL/LDvvMBQnidWx0G3yD9OSSsCU/pFUhMMFVqjx0vABgV@lists.infradead.org
X-Gm-Message-State: AOJu0YwdgnnBg/NfV8EwbddLRi03TWIQxI1EKLjKUGwn2muQcD+Pi2GL
	O8bm90X6z9LRACU2/0pSyO5CfxKSEQldNXobiqNUmQXOXZOewL5cPxeNl+KCSb6zo/ebpwsr3DK
	xL4va
X-Gm-Gg: AR+sD11HWLFdzpExYLEQTF7C6eMS26kp00LaQUVy6KDo20sGisZYhWUos2gZ8ZbFSRX
	zd94mHkOf4RZsOxjgMAoZWXoPC250mNMZDQ3phrX67xo/elbM28kVtjikgUFd9yhPiOLO21F+e3
	4N9Tp6P7bdVaPOVnRTqaQuefeob/cGl9lvdvbD4N9PCh31WW1YR9tHBJHtp8SlIX1+H+TneFE/8
	uoWs4Xx6OQRFW5UiZWzwQI5PCT+pwqI09fqDaRTt8quXoPEy6jwZx9gZgaSWYjIA6+VBVz16LQG
	VSqoKiPD9bMPqoAMLMdsI5lieNzgNL1QNRrTFpSkt0JINJgNQvhh8rQQFZhab4/zcS7O4sEWgpN
	cObCzPIAOcavc8lOdgtgWEnimGOAfW2DQA1n0dOsQp1Cd8JCua8USrm3j3GAKPJ/+ELL8TZAK2B
	A0V3V/SC6CC7u3lGl8xhkPUchqE6V3V9p7zYZMW7Gd6swHuNxfQ/PLCzDRVhWREABuxB0pof3cO
	VXZcfuWm99W6WvKS05pzlshbn+irHmmb2HKhUK03CfB+w==
X-Received: by 2002:a05:622a:5149:b0:52d:ce86:1393 with SMTP id d75a77b69052e-52dd5cecc34mr115534681cf.37.1787232457641;
        Thu, 20 Aug 2026 06:27:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd857b6b1sm30570231cf.3.2026.08.20.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:27:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wx2nw-00000003ikC-1Lb9;
	Thu, 20 Aug 2026 10:27:36 -0300
Date: Thu, 20 Aug 2026 10:27:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marc Zyngier <maz@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH 1/2] irqchip/gic-v3-its: Zero shared pages after
 conversion
Message-ID: <20260820132736.GC18100@ziepe.ca>
References: <20260820105026.53208-1-steven.price@arm.com>
 <20260820105026.53208-2-steven.price@arm.com>
 <87wltlnfay.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wltlnfay.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_062739_118293_09BF2339 
X-CRM114-Status: GOOD (  30.99  )
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

On Thu, Aug 20, 2026 at 01:32:05PM +0100, Marc Zyngier wrote:
> On Thu, 20 Aug 2026 11:50:24 +0100,
> Steven Price <steven.price@arm.com> wrote:
> > 
> > its_alloc_pages_node() passes __GFP_ZERO to the page allocator before
> > calling set_memory_decrypted(). This assumes that converting a page from
> > private to shared preserves its contents.
> > 
> > For Arm CCA with MEC (Memory Encryption Contexts) the key used to access
> > the page will change, and so by default the visible data will change.
> > The host could ensure that it zeros the page, but rather than relying on
> > the host's behaviour it's best if the guest simply zeros after the
> > decryption rather than before. Specifically in this case the ITS tables
> > are required to be zeroed.
> 
> What are the guarantees that we want to enforce post decryption?  My
> recollection is that the RME firmware cleans the caches to the PoPA,
> making the data immediately visible to the hypervisor. Obviously, this
> isn't the case anymore, since the zeroing comes after that, and I
> don't see any CMO enforcing this.

I thought any CMO stuff was principally about cleaning things as part
of the MEC change? Coherency after the memory is made shared should
follow the normal cachable memory model rules, just like in a non-CC
VM? We don't need further explicit CMOs for that.

Post decryption I would expect from all architectures:

 1) Neither the guest or host take a fault/error when accessing the
    memory. ie the host may immediately pass this memory to an
    O_DIRECT system call and have its kernel read from it.
    It must not crash the kernel.

 2) So long as the memory is mapped cachable it should follow the
    normal memory model visibility rules. ie it works the same as
    VM CPU memory prior to CC

 3) Rules for actual DMA are the same as prior to CC, the VM is
    expected to issue its own flushes prior to DMA if the platform
    requires it.

Given the requirements for #1, is there actually any case on any
platform where the host doesn't *have* to fill the memory? Is there a
platform with MEC that doesn't generate an error on reading with the
wrong MEC? Without MEC it surely has to be zero'd in the RMM world,
right?

I've argued before that set_memory_decrypted() should be defined to
return 0'd memory. I think there are real systems that *have* to zero
the memory as part of the state change and this API is now
forcing an extra zeroing.

> I'm concerned that this relies on undocumented behaviours that may
> hold today on some undisclosed combinations of HW and hypervisors, but
> that are not guaranteed at all. set_memory_decrypted() doesn't really
> say anything, and I have the feeling that we may want some hypervisor
> specific hook to perform the correct CMO magic. I don't think this is
> required right now, but I'm not excluding anything!

I would expect any required CMOs to be part of the arch's
implementation of set_memory_decrypted()?

Jason

