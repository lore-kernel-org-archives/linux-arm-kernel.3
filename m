Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E937CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 04:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2hkMG41D7UumAODedFGWVazHZhYrfBwUFGTzkSTLig=; b=0qfwJjRhgusrHQKzYlYpC4M/5Y
	eMyX4ibzRhUZGAiWZ3+tqwrAK2U/JyqYIhaxgUM5td7GzqOdhBrKMz42fwFHIirxp/o4Bfj0PDZPZ
	wDyInR1DssE/9YzLidkQ8Vbdvxl4x3VAHIi6utYMRv7r2ohjKWU9IXM3zri9R1BsJMVL2Pq1MJcW/
	uwAzkPHd3xn8eGTE+8X8zu0lGTrWk0WFn1KbH5Mfoz6IHPNKL3K3ynGAog7TWqMTjoLXEbb6ikZpU
	cyiSRjqwdWrqLKJg97NRh0pM8cRltFCkm0GACawECwhJxxy9uBMaTVLZ1WDhSt1QofdTunyhnJldh
	RyOQxpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPuhI-00000006cW7-3O6J;
	Thu, 21 May 2026 04:07:48 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPuhG-00000006cVa-2pWz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 04:07:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so3935979b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 21:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779336466; x=1779941266; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2hkMG41D7UumAODedFGWVazHZhYrfBwUFGTzkSTLig=;
        b=pwsin3XtRBuEdFhUwOX8ujw7dpGXekI00AIOX8rAihJQS0tVIxfYpg1m5g4IjfvODN
         eM/6zusxjDb4fJ7ehMYBz5HOUJyQ/z9MuQCkhFwXmfYF06otcEeiCQrvNAQ/7AnQ/bdz
         A9g/cnk3worLZhpnoPB/4WhTgtgAfT0mADq9S50w5+Wm15mRfhXp7WvIv1KnXpi9j00u
         tNTTKn3wC6w/4Oi9yfJUnnC//xX/HKwnPWf7k/DyFflF3lM22tfNAEsJaP/sPtcEA9Q5
         KiIxeqQM/+Ypv1kcrU7HKNDQRoDcc0RU5txXE7UE+/sUbzaGJdr5gRqZkNVVSTyxx4eW
         5Hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779336466; x=1779941266;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2hkMG41D7UumAODedFGWVazHZhYrfBwUFGTzkSTLig=;
        b=dzGOsNScHjAUMlRvZaXg90+DTtdx/dG8j7cvlvrVRX+S6CNhRNyUMb6fy4ADAkAQYf
         ZM89/VPamtd0J2J6OX/SGAjj3womRzgngKTex+js+dEVy/iUWkqfWyu8dgbEgO8JaTRw
         9YhvpfmzrSSpXbXw2oTa8K/mc4h+l+9mwlYw4WgKjXpiv85XyN0hi8DwvyeTr+cAm7t1
         HkKvoefDfu9ZTyceNytPz4C9NQSgKNrBpBv+GobNuEmg3EOZJ/ZGt2iKlBO4mbH7o+Mw
         CspPxZrUuNpvT2JjaVh8T9fsewQQksAepV9pQm4FfApFjlz9TlfIKu554E5WGMPzRa4W
         MRog==
X-Forwarded-Encrypted: i=1; AFNElJ/9WlKX/Aw3cBk9gyCsxOD7OPkZaxlKPr1DCqArfPv//RA0OVLhVwpP/iwCXThwWTw6SLONY5+k96FKTLlzDU9t@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2UtxouVcdxIztIDJoblwz0t1hKeJjzHgAslaP55wgjQwlxsCr
	Qg4g8QVuIhGW9mYalSEP7PdWq75ZZECHbFPny1U/cglyRunfby87CDdw6rWz7YCYkuJzPIGYRT6
	vup+31vtT+Q==
X-Gm-Gg: Acq92OFNCJ8T8MWvyexSf2ojpb4IxjJFwrw2DdTy5u50+PnBnvu3WtJ/rjVTlg/wIti
	uHfMTIt53pxqWjv2vLSTqjTp9EgFjVLT+uKhskmE0NisvDlEQbQJd8ToPwuLFkZWnOrsi55EaH6
	jpig0+2iNgvQA/4IvRv5FTVOWZ5ac9Vc+dkL+XNbB/xC4jIAnqsU2KaZTjRRvnQBkibkLlSLXxA
	5VTkGvjdOrGUlFHPUIj+b7LMjSAEWf+IEcoZFZJ7ehlkFolR+obYNxBzeaum0vKsamFTHtkgRCc
	CWkd0JD1JHoPWOMV5xlcZxzVG9JkjOLEWJd700rX6D9/WT5xxG1luemh4I2YFTTUuhjhen5m0Eh
	v/Yyl0A21IgZUypK7XCrbbLcjYsdmFf7zyY3y6xIirucV/jNjVJf5K0q/8kjN4S4oMLmpeDFWVV
	XWhOPHiy44oZzlNGB53awyih6yr4FRkltSl4M=
X-Received: by 2002:a05:6a00:4c8c:b0:83f:250d:59c with SMTP id d2e1a72fcca58-8414ae6e912mr1347583b3a.39.1779336465527;
        Wed, 20 May 2026 21:07:45 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cd19sm22757564b3a.54.2026.05.20.21.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 21:07:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 00:07:44 -0400
Message-Id: <DIO24V5XSTSW.2PW1QDEHN0T3M@etsalapatis.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>,
 <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] bpf: Add bpf_struct_ops_for_each_prog()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Tejun Heo" <tj@kernel.org>, "David Vernet" <void@manifault.com>,
 "Andrea Righi" <arighi@nvidia.com>, "Changwoo Min" <changwoo@igalia.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260520235052.4180316-1-tj@kernel.org>
 <20260520235052.4180316-5-tj@kernel.org>
In-Reply-To: <20260520235052.4180316-5-tj@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_210746_720230_5964ACBA 
X-CRM114-Status: GOOD (  23.22  )
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

On Wed May 20, 2026 at 7:50 PM EDT, Tejun Heo wrote:
> Add a helper that walks the member progs of the struct_ops map
> containing a given @kdata vmtable. struct_ops ->reg() callbacks (and
> similar) sometimes need to inspect the loaded BPF programs, e.g. to
> discover maps they reference via prog->aux->used_maps.
>
> The implementation mirrors bpf_struct_ops_id(): container_of @kdata
> to recover the bpf_struct_ops_map, then iterate st_map->links[i]->prog
> for i in [0, funcs_cnt). Same access pattern, no new locking - by the
> time ->reg() fires st_map is fully populated and stable.
>
> A sched_ext follow-up walks the member progs of a cid-form scheduler's
> struct_ops map, reads prog->aux->arena directly, and requires all member
> progs to reference exactly one arena, without requiring the BPF program
> to call a registration kfunc.
>
> Signed-off-by: Tejun Heo <tj@kernel.org>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  include/linux/bpf.h         |  3 +++
>  kernel/bpf/bpf_struct_ops.c | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 64968ca6db51..5b99d786e98c 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -2129,6 +2129,9 @@ int bpf_prog_assoc_struct_ops(struct bpf_prog *prog=
, struct bpf_map *map);
>  void bpf_prog_disassoc_struct_ops(struct bpf_prog *prog);
>  void *bpf_prog_get_assoc_struct_ops(const struct bpf_prog_aux *aux);
>  u32 bpf_struct_ops_id(const void *kdata);
> +int bpf_struct_ops_for_each_prog(const void *kdata,
> +				 int (*cb)(struct bpf_prog *prog, void *data),
> +				 void *data);
> =20
>  #ifdef CONFIG_NET
>  /* Define it here to avoid the use of forward declaration */
> diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
> index 05b366b821c3..16aec18ed31b 100644
> --- a/kernel/bpf/bpf_struct_ops.c
> +++ b/kernel/bpf/bpf_struct_ops.c
> @@ -1203,6 +1203,42 @@ u32 bpf_struct_ops_id(const void *kdata)
>  }
>  EXPORT_SYMBOL_GPL(bpf_struct_ops_id);
> =20
> +/**
> + * bpf_struct_ops_for_each_prog - Invoke @cb for each member prog
> + * @kdata: kernel-side struct_ops vmtable (the @kdata arg to ->reg/->upd=
ate/->unreg)
> + * @cb: callback invoked once per member prog; non-zero return stops ite=
ration
> + * @data: opaque argument passed to @cb
> + *
> + * Walks the struct_ops member progs registered on the map containing @k=
data.
> + * Intended for use from struct_ops ->reg() callbacks (and similar) that=
 need to
> + * inspect the loaded BPF programs (for example to discover maps they re=
ference
> + * via @prog->aux->used_maps).
> + *
> + * Return 0 if iteration completed, otherwise the first non-zero @cb ret=
urn.
> + */
> +int bpf_struct_ops_for_each_prog(const void *kdata,
> +				 int (*cb)(struct bpf_prog *prog, void *data),
> +				 void *data)
> +{
> +	struct bpf_struct_ops_value *kvalue;
> +	struct bpf_struct_ops_map *st_map;
> +	u32 i;
> +	int ret;
> +
> +	kvalue =3D container_of(kdata, struct bpf_struct_ops_value, data);
> +	st_map =3D container_of(kvalue, struct bpf_struct_ops_map, kvalue);
> +
> +	for (i =3D 0; i < st_map->funcs_cnt; i++) {
> +		if (!st_map->links[i])
> +			continue;
> +		ret =3D cb(st_map->links[i]->prog, data);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(bpf_struct_ops_for_each_prog);
> +
>  static bool bpf_struct_ops_valid_to_reg(struct bpf_map *map)
>  {
>  	struct bpf_struct_ops_map *st_map =3D (struct bpf_struct_ops_map *)map;


