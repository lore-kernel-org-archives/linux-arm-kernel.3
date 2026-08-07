Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB20AC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpOmJpx/ADqA+1gbMGirD4LpSKVgKnj37zwmvfF6jPY=; b=U4Ef60K2QixjgA2TamT3LWjfvP
	PmnCfoRtCNjwFzF3egmr+H+QUdOpJ0H52W7lApKVYDP44I9EuHCKYq7FFXkGuGiD9YqpUnXzYvE55
	1ZT48hIAQKN9oImgYc0SMDyOZKBFQwqpCoAPUxzTybGd3yZiziHsPNd+8G6k39NOUMLMv8P15RgIk
	IRuisL/N29aUfgUOGw4V1NxIoBMlU0jakDx7tIIppiH6NDg7lsnO8WtVmM0X0L7x2bRbFGbAJR21m
	H7/Z4UGCA11+iv9TSp8nAbYJTmOm2VClx7lUKUSnovVg2OJEWaA26VQUwgvNg2IdsTkZtd7tDmRaQ
	UUWF6tlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLdI-00000008HFW-05IB;
	Fri, 07 Aug 2026 14:33:12 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLdG-00000008HF9-0KH4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:33:11 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c2055573c8cso360552066b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 07:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786113188; cv=none;
        d=google.com; s=arc-20260327;
        b=a2rDRjEpRRS0lfKJi+X8vEPKADNnJ6UH9APIdvV9hXuIVlct76DkfPvHZ59A3/o8gE
         awC5D/iiMkybZ0iHoJn9FRZEqLHpzpoldQjUSEZvHZ66lxl8rS3g6Ev0PvrcjiOP/cZz
         T2oWUOsO5u2r2y/nvtMunpAelJWLliTjn54nRFmd+aNzPGCkYacm5nPTBQ4Mfr2QaL5F
         J1L3tLq3xag/9726GfVwgY1hJpw687ZbufKBGK8tb1axBGY6Evq6+uEzuyU91TRvN/JC
         JJ9/MhW3zPA+tOPQygtJQaZHDKx291hmJ570vB97Pa+oyo7CA85XPKq5J3AYrpFfP7IB
         dV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HpOmJpx/ADqA+1gbMGirD4LpSKVgKnj37zwmvfF6jPY=;
        fh=NnLn5eTL4Hljz2ys0y5IdTD/xztI93Atg+32VdXMsQw=;
        b=Lbt2j8sIT5s82JySdc4Xwz73S+0/Aq606L8fEQlHHtETW9o9/mnuvXUvgctY9Xv+kw
         QTzhzdxgRMOpKnEizTC7leTgUKIOlKRaiU7Lqg5CzBvICWmPsIHqSpNqDCPu/FhzG2xR
         HPyvZneXmUOhbrDh5BTxiBMWwdzirO6plbEJXsS51LXzjXphQEf4/oc2/Pegf+qvM8EA
         5Cg0gZmrwKnqRW5j+gUg98WAFkM031DiU4IGFvjxnv4EEM8WDink2n4Po8BzMv12jUPM
         3sZou3XPIow2PFUgOCX2XEEBU8Dytxacjbiyy/Y9PoXwJIHigl+LTajz5r2fKvNx5w4Q
         G8RA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786113188; x=1786717988; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HpOmJpx/ADqA+1gbMGirD4LpSKVgKnj37zwmvfF6jPY=;
        b=gLL3MSO4ZgOJSD9OIPNMMhs0A14gjwvI5ZghMFhUvogRONpXqQoqY3zA8cksHpL5Lb
         +QPDk4IFat3l2i/PL+jao9d2xN1/tdCRbFGFZjtiLjMD9Wtvi2SgXgcqfd1s5zLWcpMk
         UQirh989NiyYf4tTmQSYeg6xprcxr1yHc06OkOax4jeNhzHcHC8hxZ8ZY592paVpw2sh
         ct/DCn6c/iTNchLCWycVsxRlqXlzGsynyvOi4yB3Pa9hfP/HH9DKOiuLlqLicHOg7y1B
         iSyBsI2rUhFwOs++mHoawRVUyBaUsbPeVlMwvXubbA+X+QJ/ll1imsh6I2zJsaJgzdS2
         MA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113188; x=1786717988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpOmJpx/ADqA+1gbMGirD4LpSKVgKnj37zwmvfF6jPY=;
        b=n1EEhzqaB2PJtpAvdSYNZ3MwNmAXzifbgX1x0d/bDakl3/nj+CCNrZ9ttB3eyyhe+r
         eJLG+v6Kw4OCWAWUKoxGzp5AnvDWZI+w8BQbBGyLT92FgniECMho5VS4drfexnS76Fj6
         4qKcYQ7z+wa8YWbPozbIlypxuc+pxJpTWNgkcjOjTkfiKLUGjzMHfuai+Z2trnhoMQM9
         QdIRBc50fWUylh4/rf4Tn92UCC+rvAQJmnkt8AiFBoiU0V4uvrppwiH92VVaSuNF+CLV
         7FaComnHqKY5fGHp4FnVmPfbRzUtFWT4yZoumbfEmbciQpyLbNJ7jtVAm9g2iemHsrw4
         27rg==
X-Forwarded-Encrypted: i=1; AHgh+RoDFCoPJbSf3NkyCcbnsNwrPRObPubytNAr0iRihBCeeUme2wCDoC0rgIuaneDrtbo8zm7vP7FC/yLW7OOY+u2i@lists.infradead.org
X-Gm-Message-State: AOJu0YxpHO3ZVdRZdMZXqWYu1pwRNhwNZ8L6SQi00MsEOtga8TkFGMFY
	xMAkzaK+C14TtVVWEbgS3iPI7F+ZtRM98Ic3AUMCbcVSPqHL7ibKyuso+zONu0xKxHZbLK9E9lO
	dw/XdyFU4Ws5e9Wv9KBiAIds6cfVjrQs=
X-Gm-Gg: AR+sD11ENpV55IZ6JyRIztU5hdEnKJAEBIVH78O2QDYi9y23LiKRExxUaxQ4CjSGysa
	GCjN4OJ0EyOLpa1rC6H6Q5pVZfYIciK0ce3OvWey2oJ411162ExvS16lxayQCxCWdXb4pFCQteL
	RSNH2Xtd8FrRUKm4B1DuGwgbp9tJKhFwXEFnwA1Vuqurb885Z8eY9fG1nJOnydlzBLxLPx/sEsu
	SeaqOTqlDHsym+bbsfev+WGW0Im4EeW80p1XofH2loCmd2yWFOverDlzLPtqnyND/mu8iLUWcZD
	/ehn++QLm+IKyTM+DudSAAUmg+5CYe+n4NFIsNQlabWpd9QwkIROEJZMhOCi
X-Received: by 2002:a17:907:1b12:b0:c20:191e:89f3 with SMTP id
 a640c23a62f3a-c2039c563admr1000445366b.16.1786113187576; Fri, 07 Aug 2026
 07:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260806135224.3267890-1-puranjay@kernel.org> <20260806135224.3267890-4-puranjay@kernel.org>
 <20260807102932.GU776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260807102932.GU776954@noisy.programming.kicks-ass.net>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 7 Aug 2026 15:32:53 +0100
X-Gm-Features: AUfX_mxyzLraY9hB4bhCgklGOwwZVl4fSNPtqGoxIfRbh3s6Vi-E_Sl4h_YJMAA
Message-ID: <CANk7y0gxiQdKsGKrF2xhp5nS7Vc6zGBVVSb_US_x_Eb6vyZjhg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] perf/core: Clear the whole branch entry in perf_clear_branch_entry()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Usama Arif <usama.arif@linux.dev>, 
	Will Deacon <will@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_073310_169783_02E02EE2 
X-CRM114-Status: GOOD (  22.51  )
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

On Fri, Aug 7, 2026 at 11:29=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 06, 2026 at 06:52:23AM -0700, Puranjay Mohan wrote:
> > perf_clear_branch_entry_bitfields() clears the bitfields of struct
> > perf_branch_entry one by one and leaves from/to alone, since callers
> > overwrite those straight away. The list has to be kept in sync with the
> > struct by hand and has already fallen behind: new_type and priv were
> > added to perf_branch_entry and never added here.
> >
> > Only BRBE writes those two, and neither is written for every record.
> > brbe_set_perf_entry_type() leaves new_type alone for a branch type it
> > does not recognise, and priv is not set for source-only records.
> > arm_pmuv3.c allocates the per-CPU branch stack with kmalloc(), so such =
a
> > record carries whatever the slot held: uninitialised kmalloc() data on
> > the first pass over the buffer, the previous record's values after that=
.
> > Both reach userspace through the branch stack. Nothing under
> > arch/x86/events/ writes either field, so x86 is unaffected.
> >
> > Clear the entry with a single struct assignment instead:
> >
> >       *br =3D (struct perf_branch_entry){ };
> >
> > The bitfields add up to exactly 64 bits, so there is no padding, and
> > every caller assigns from/to immediately afterwards, so zeroing those a=
s
> > well changes nothing. PERF_BR_SPEC_NA is 0, so dropping the explicit
> > spec assignment leaves the behaviour unchanged. Nothing needs keeping i=
n
> > sync when a field is added.
> >
> > The helper no longer touches only bitfields, so rename it to
> > perf_clear_branch_entry().
>
> Fair enough I suppose, but then why not write it like so?

Yes, that is better. I will use your version in v7.

Thanks,
Puranjay

