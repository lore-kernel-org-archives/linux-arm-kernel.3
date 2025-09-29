Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51D9CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJLpaj/c6dWR6gSCWApgd6FdexxQb0VtbiytQ5OXSGA=; b=oJlAehsM2EoZRrJmOIZJTkj/Ex
	wu/VktPO3Vlah3GU6YadxC/W65NbXpAvCU8Jiyyc4X9M/ceD4W5DMvhbVndapWsFVF7SMUoXvKI+p
	Oz7IOVQ1ee+nVHzb8ao02bzdeVcxPH0JhAxDvxJe/MsOn5D9Asji4YMgpgDHCBA7U2JbZENsEM64n
	EdoCk43gFVv9WO55Rn77GNO8c4+8tR8efEPivCW+myTvGQOxqMj+QrIWLYcVTnihFIrcytxdF+uF3
	2IIVi7HMrtpICjOhzFwhE9toxTLkxEDGV3iRNy84dJu1b/c6XMjEjfGTh0Y0LGaVqFWhNQEkHAWvE
	tkp1VfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Il1-00000003GcB-0sUp;
	Mon, 29 Sep 2025 18:37:55 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Iky-00000003Gbl-49Ci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 18:37:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-78100be28easo3671381b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 11:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1759171072; x=1759775872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iJLpaj/c6dWR6gSCWApgd6FdexxQb0VtbiytQ5OXSGA=;
        b=WymJDuJd0OQo4sWoSgZW6y8j5pkH7OCVDKmVSkiNKH37pywsAqFnXrTvIYic6PmeOL
         EreEgeIauDTWl59O78dVaWhDoeuYWjQHUWxpVuhTY6gBtJJK++PBPpB9odxkIMjye+g1
         8m1r9ZSKgRF3ZhZXJWIhtVJcnAcYzhC5odiL+N9xPvRyzVVEaPi+YtsxVdLDhcI1ElHF
         cX8RCj/QfJKXDx2oVdiehyuC+BE3OTHnDd4EiR+eIz9ibl4AacAHtsNyN8/bzP8UrwYh
         iPyPDyKgV1Hb/KNhj/K1XgCovBieMQyrtiUIdAFV2tXbNU0MTyh4ZuHz3sJOs1zl4DC7
         JYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759171072; x=1759775872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJLpaj/c6dWR6gSCWApgd6FdexxQb0VtbiytQ5OXSGA=;
        b=pliMsiAdXZJpk6YDnQ9PmQxJIQAcTA8tIxbxqFBd87qp5plm0PQDNXNvT9mqOFsPJL
         HVjtdxJTXYt5NdTDj41ZM3bEmEP9dj3nFI1gfp6sll7aMc3yE337zlkL8jXN0JQdAWEi
         qOPQLgA1mkM/MKZhFlxc7ISnxIYvn07nAW531Hwr76//spVhJtdC8h4Luo8SWTK/ie2W
         GDirkCkjUnElmDazGw6iKuFxGBPHrBqh3HBqsRLlXobqfPSR21dylzePXIe1j1X/iC3P
         iNvIjZv+Si48ZroTWx47+Fwg047CoEypvb7TOltuTGjDcBKEysnNyIE3huZLi2W/YxSB
         v6sA==
X-Forwarded-Encrypted: i=1; AJvYcCW+aCeU+Tn82yULpegoyMcqEE5bUwBCmLVxVGVaR8HiuWocQ2xlL2TdnFlLggycyhH+m9cddd5TzRvX9yCzf9ev@lists.infradead.org
X-Gm-Message-State: AOJu0YzdvfeY8z+CAeNcXoIRauULiJBIbdm4eL1BSnq9y8tWEH5pGFXy
	B4LsdxBIEMN5n+QdLiXLS2S9u5Xi/NcoXC3XrozjCEfP47t3VmV6yE9TIGb+ypuqynY=
X-Gm-Gg: ASbGncuMxLGt7hwk1Fz4Wfc4oTI7oG3GdFM4EzaYU8v1dfjtbvfECpEFVnIKULeMW/G
	P5ULwgLu37qJ3+wbHh8ORkAEzHInIeQR/6xNy/facZ3C71+ZTB0d4VP7lZBAulnDKaF9NKrvtig
	2paQ7P/WghYMrcpZPg1O+Ul8/C8HpeQad97K+IxwJFfsTNYjmLS14QRdKHqEi8EnpohwHyq2BAs
	DOsfELdlxSQXCOLK/WZnX15u5arOKLnBTMCa2bYQPTZc0l3tnLfx9sOvRLBzER6ccyfhbaP7v1S
	XOFAEeV+zw11/jKMG3ZBmI14QIHNweA9C3hJnp/KSi95qdxUwMvDXhDbPF41zSI0EAi/rtyie5c
	bx0DO+VBZmqI8HBiYwtmlZK4FSCWMl1N4
X-Google-Smtp-Source: AGHT+IHBfLpwSOdsOZ3rlXG6ZEpP4ToRS6T8QkcIX5AOO47fspaa/84bLNk9yI3gfkzoA6f1KMT5jQ==
X-Received: by 2002:a05:6a00:138d:b0:781:15b0:bed9 with SMTP id d2e1a72fcca58-78115b0c301mr15805467b3a.17.1759171071800;
        Mon, 29 Sep 2025 11:37:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c1873sm11683639b3a.23.2025.09.29.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 11:37:51 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:37:49 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
	"nsz@port70.net" <nsz@port70.net>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"dalias@libc.org" <dalias@libc.org>,
	"jeffxu@google.com" <jeffxu@google.com>,
	"will@kernel.org" <will@kernel.org>,
	"yury.khrustalev@arm.com" <yury.khrustalev@arm.com>,
	"wilco.dijkstra@arm.com" <wilco.dijkstra@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"codonell@redhat.com" <codonell@redhat.com>,
	"libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] arm64/gcs: Allow reuse of user managed shadow
 stacks
Message-ID: <aNrR_TD5JB5dHJ5b@debug.ba.rivosinc.com>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <760447dc3e5805bf5668e80a94bf32356e2eb2d3.camel@intel.com>
 <8aab0f36-52ad-4fd6-98c3-bcdba45dbe16@sirena.org.uk>
 <ac0ceb09ffaeb1f0925b61ed1b82ee6475df2368.camel@intel.com>
 <604190c7-5931-4e74-a1c9-467e52d3001b@sirena.org.uk>
 <eab692794cbc82080b708c581efd5973b6004be0.camel@intel.com>
 <5397025d-7528-4b9c-b38d-b843ab004f47@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5397025d-7528-4b9c-b38d-b843ab004f47@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_113753_202961_3C2232E5 
X-CRM114-Status: GOOD (  20.34  )
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

On Fri, Sep 26, 2025 at 05:09:08PM +0100, Mark Brown wrote:
>On Fri, Sep 26, 2025 at 03:46:26PM +0000, Edgecombe, Rick P wrote:
>> On Fri, 2025-09-26 at 01:44 +0100, Mark Brown wrote:
>
>> > I agree it seems clearly better from a security point of view to have
>> > writable shadow stacks than none at all, I don't think there's much
>> > argument there other than the concerns about the memory consumption
>> > and performance tradeoffs.
>
>> IIRC the WRSS equivalent works the same for ARM where you need to use a
>> special instruction, right? So we are not talking about full writable
>
>Yes, it's GCSSTR for arm64.

sspush / ssamoswap on RISC-V provides write mechanisms to shadow stack.


>
>> shadow stacks that could get attacked from any overflow, rather,
>> limited spots that have the WRSS (or similar) instruction. In the
>> presence of forward edge CFI, we might be able to worry less about
>> attackers being able to actually reach it? Still not quite as locked
>> down as having it disabled, but maybe not such a huge gap compared to
>> the mmap/munmap() stuff that is the alternative we are weighing.
>
>Agreed, as I said it's a definite win still - just not quite as strong.

If I have to put philosopher's hat, in order to have wider deployment and
adoption, its better to have to have better security posture for majority
users rather than making ultra secure system which is difficult to use.

This just means that mechanism(s) to write-to-shadow stack flows in user space
have to be carefully done.

- Sparse and not part of compile codegen. Mostly should be hand coded and
   reviewed.

- Reachability of such gadgets and their usage by adversary should be threat
   modeled.


If forward cfi is enabled, I don't expect gadget of write to shadow stack
itself being reachable without disabling fcfi or pivoting/corrupting shadow
stack. The only other way to achieve something like that would be to re-use
entire function (where sswrite is present) to achieve desired effect. I think
we should be focussing more on those.




