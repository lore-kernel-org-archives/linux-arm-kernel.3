Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F822D39013
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSZqhr7fvldty9yhJSzFIySWtqFdFNfdF7+2G5csF+0=; b=LUKled2hQ3YEhTQAHhpsw9FO/q
	/UOt0lgLWvmjXzHTarvTPJ8W5mT3fvhujxxFV0e/1CWO+ahIlnoBOv/SypAL9HMjqm9hyQOtDCpY5
	njWed+ZdZ6xmllW/RbIau9e1YbQPv3aympDTNyeMNMszBCX1Co0WpLTD7NzvHohR5ccQLh6kBU/NA
	MsOEcQaWFr5XPtWLkfP9edRppbdgXAj34BdDJvwx6ja3uxHEHm128bcFZQrLwfc6UBTO4VISgOuri
	Llwp7keWctVPSoznVmVer7+9QFwumMJWUU7/FNwERMklNEyk2rOTQ6JViaIrAfDXcSCHBX4apdA5D
	aHfTnqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7l2-0000000Ag3i-3f7c;
	Wed, 14 Jan 2026 20:46:24 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7l0-0000000Ag31-1mdV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 20:46:23 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1232d9f25e9so402354c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 12:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768423581; x=1769028381; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PSZqhr7fvldty9yhJSzFIySWtqFdFNfdF7+2G5csF+0=;
        b=XAVThil1o0ruQqtBZnyCSP5ouLY+yY29goaZdJ2DuT8cvTjVS2VScgOFRscEge63Bj
         C9b7/v0f2eJ/6V8G8f3gtbWwOU4eq1DzKmGYeRUlTMTLkWMinNZk3fzL54h+T6wRWy9v
         7alu9vkXXz6ulTgw/1ZPTIla/HsAMB9glpFLv1ji2BqzVmlzgyTBSlg0S8eLLrq53UZb
         W18O455mNjTfIz/BFaBMflnDAPxHeqFm2gNE3klEf/gaGzvWOfQPSoYDFHUQbHMpmDF3
         yUXG4wZyBC5nKPtaTpAO30bhLZeTrOBoIx4zovk8lMg4+CaO+XDrExU2VA5UTW+y7cIL
         m9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768423581; x=1769028381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSZqhr7fvldty9yhJSzFIySWtqFdFNfdF7+2G5csF+0=;
        b=KmKZo9MSJ9XZRcXk1p/otoqEIPhgkf3XJjM0z1whoz468PfcTXOqL3RGh5FQmttGHA
         Q9KsGNfoRGX2nEYQP5pgKrqJwKzO7lezdpwhGic+VVSAfkZy5OsN0HzNaDGoH/reCwPK
         2wU6ymidQOM394AJ2Dk3b+LMdXh/ELjzAmT3dPCjdmZDk625VpuwWRaFuERztOPTn2io
         NxdS3/HI4C5HQxpy/RW+3uMYYhtcgQm0OiikaNHGvY3gWTR4aHgRvyE8LJpDEj5mSl5Q
         Luct0tgYno9jHxn0e+x1Z9Y2xFw6bH6BGN5ahlstZ3jlj1exyA8UG77eo95v1nsC0ZZH
         UXZA==
X-Forwarded-Encrypted: i=1; AJvYcCXacYfVhGG5CvaEtknS2nV0FqtzRYiG6omKH4DuYIMU4Yqn0N51ryIoDhQveiEfWzp9eSfLIYjA2gASLadMmb5v@lists.infradead.org
X-Gm-Message-State: AOJu0YyYXPBmBURwWEm7/nAdjhJUZh6BW32BOPXegjON0hquHXs/uzJR
	4f4od+H5JnYrDEacrWZy+dltTzhlTr0naW7Uc9vIBV56uSpx98gdCR4+
X-Gm-Gg: AY/fxX58PJsrS05Yj0IaT3Hx1p1/A8l44URmUWIdBCEclweYGanjeZBw+4r4ti0uf+A
	i7tsBR+I2wRk6PzNODK3WPED8l6LxYWgBiq8PHXGQxRERn9JY1ksXucYPX3CbfpYhXjk1xxnPjK
	nsjaJKRunN9u7YBkBQw2v/HeYTRxf15V2nsbACemghVOT+auEfjsp3JNnBNz7xGiCXJ4JojbnEH
	dyX2+I8F89D2OQFkfCoTVz5UzgYe/slayRmE5Vqod7o4D4WioFk7k9YODln2iCMHrgt0UCPNjJu
	Crd24eoBKwYBbs+I0Nk3xbFrlp0s5TV1X4dXWtOdsCIIkI6pcM6oZphWjLKJHzx/9raovZh+riR
	zAROhBtbP0lcXi9sxnUtUXnQCHiTaO1euSlpgvZ4e1M7h/ATHQENJ3u3r3xDUGf3Jqr0Xzbiyvh
	YChHfXjWPI9flRiCpLjsHZA42A+SUvc+ZIfQ4xdmus3fJRDyN685WuYFsV/pz+xyyKSQ==
X-Received: by 2002:a05:7022:f516:b0:11e:3e9:3e99 with SMTP id a92af1059eb24-1233778d7d9mr3337201c88.49.1768423581158;
        Wed, 14 Jan 2026 12:46:21 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:19da:d3de:fbdf:aaba? ([2620:10d:c090:500::c9bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12316f2db84sm12839971c88.14.2026.01.14.12.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:46:20 -0800 (PST)
Message-ID: <2e5ed01463ae8f79780a42c4e7f93baeafd2565a.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 2/4] bpf: Add helper to detect indirect jump
 targets
From: Eduard Zingerman <eddyz87@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Yonghong Song	 <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov
 <a.s.protopopov@gmail.com>
Date: Wed, 14 Jan 2026 12:46:18 -0800
In-Reply-To: <20260114093914.2403982-3-xukuohai@huaweicloud.com>
References: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
	 <20260114093914.2403982-3-xukuohai@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_124622_467438_874415DC 
X-CRM114-Status: GOOD (  14.74  )
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

On Wed, 2026-01-14 at 17:39 +0800, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
>=20
> Introduce helper bpf_insn_is_indirect_target to determine whether a BPF
> instruction is an indirect jump target. This helper will be used by
> follow-up patches to decide where to emit indirect landing pad instructio=
ns.
>=20
> Add a new flag to struct bpf_insn_aux_data to mark instructions that are
> indirect jump targets. The BPF verifier sets this flag, and the helper
> checks it to determine whether an instruction is an indirect jump target.
>=20
> Since bpf_insn_aux_data is only available before JIT stage, add a new
> field to struct bpf_prog_aux to store a pointer to the bpf_insn_aux_data
> array, making it accessible to the JIT.
>=20
> For programs with multiple subprogs, each subprog uses its own private
> copy of insn_aux_data, since subprogs may insert additional instructions
> during JIT and need to update the array. For non-subprog, the verifier's
> insn_aux_data array is used directly to avoid unnecessary copying.
>=20
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---

Hm, I've missed the fact insn_aux_data is not currently available to jit.
Is it really necessary to copy this array for each subprogram?
Given that we still want to free insn_aux_data after program load,
I'd expect that it should be possible just to pass a pointer with an
offset pointing to a start of specific subprogram. Wdyt?

[...]

