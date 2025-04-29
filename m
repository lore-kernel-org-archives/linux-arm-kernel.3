Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3905FC3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOccUcgqfvWaXc4pvwi0m7BpDvUg7o44noDlWR6wMTE=; b=HwYXdyGwdTE5rf+OeVBqROScHz
	JMNA4ONQhN8COr9nLIKTpNFG0cD/6t9CqxNcP7qQVL+DQltPs8u07xV1x7nWyyrPe2qwi47pWPNs8
	DBRax1wSPhYyLb/6jx2k9XamhD5EJvCd+irn+53DZjRGlUyDcMSmZC+mtlAmvd9iIUkB1zu55tb+J
	iK3hodANoSb7E6nKk5i1rEe+M1Rn5d8L8XWxt9Toy1yQC7Ca6GwTCVexvTbd5Ik7q2hP5ogxXtMh4
	7awQewXCzate4e5AoSFh6LsQfL1m7H/wVpndVpkYE+X0eh63FelPdncPVMpUCC6DrJK80ihVrI3bQ
	1etxTaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mvT-0000000A8Ut-0S0Z;
	Tue, 29 Apr 2025 15:31:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhM-00000009rma-0dXd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:12:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04BEB4A51B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDF5C4CEEF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745935955;
	bh=68cW4ZforvOQzheTtZyyFvpW8rkRGsrOL6sivyfyl9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p7tCl8ad5Adz/XjilPNVRg7bc6iNBo6R6g7SeqHC0fXmnjGeYJTYQ4pSpzTGaJi8H
	 WU8GHdO9vzXyu+jhUCotgSMwJ7MMMlBCZ8Rpm+CWQwtpyUMx97ll7KYjfxu1NsoO6d
	 VLEO7hg5WudPMap+8QsPlm3FCiOsUfL2/I8mfi/0udGksCMCTt4yTyBcrP98rKe/MY
	 u6gb6kxz5oBIOyMKCkt+qLYlxjc1rlfSiTQ+2Y+oRMhQL5K3WPqM+KR8f8H3DSDr3r
	 WibX7oqwpnEjhvSLcXEy0yzuoqMMvTCkbmg/srskbOnwnGi/Q3IY5qASVS/ZLFRVVA
	 4dEawA1DlLYAg==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso9491527a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 07:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEP0u4sKfSeILaOuN2lp19xJEB9YpO6BbaveMRMSgwAgjjQn1UUO89oYetiJJNbi6CsVKgrJXZuPw2kMg53LOf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw29w7ViPVhTmH9J/B76lnXC1BdWWw4trDSrucMTpxs6u0OL/s1
	3/daM07knLHOP2rTtEV/p53M4bhda/Il3u9ITlXJEwekVb3rfWtMWA15QOzsQGV4XovRnskxtiY
	twDjVpiKGsrtgM4u91aE3DVuWxA==
X-Google-Smtp-Source: AGHT+IHF9LLsBRnDGdFGg7NcSnHBwKMcpEBwvXfP2vD3nYugY4TaStR4VLwZ3jkNT7pJPSzFOgkU3/lfDYyB91jKoEw=
X-Received: by 2002:a05:6402:2707:b0:5f6:23b1:ab43 with SMTP id
 4fb4d7f45d1cf-5f83801e6b5mr3752497a12.0.1745935953526; Tue, 29 Apr 2025
 07:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250422084340.457-1-alireza.sanaee@huawei.com> <20250422084340.457-2-alireza.sanaee@huawei.com>
In-Reply-To: <20250422084340.457-2-alireza.sanaee@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Apr 2025 09:12:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+c9ipDNYB8PTc38xThgsMkjk9bp896_=y7a5r3v_muvg@mail.gmail.com>
X-Gm-Features: ATxdqUGLpxoyUPcs3uqq8T1sfWTnELobJTZA-LgabgMRIzuY3jqy3EEPe1QkbjM
Message-ID: <CAL_Jsq+c9ipDNYB8PTc38xThgsMkjk9bp896_=y7a5r3v_muvg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] DT: add infra for finding CPU id from phandle.
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree-spec@vger.kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com, 
	linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_071236_240634_0BC7EC7D 
X-CRM114-Status: GOOD (  28.07  )
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

On Tue, Apr 22, 2025 at 3:44=E2=80=AFAM Alireza Sanaee
<alireza.sanaee@huawei.com> wrote:
>
> Get CPU id from phandle. Many drivers get do this by getting hold of CPU
> node first through a phandle and then find the CPU ID using the relevant
> function. This commit encapsulates cpu node finding and making driver
> code easier to cleaner.

easier to cleaner?

In the subject, use the prefix of the sub-system (of), and drop the period.

>
> The API interface requires three parameters, 1) node, 2) pointer to CPU
> node, and 3) property which includes the phandle. API sets the pointer
> to the CPU node and allows the driver to play with the CPU itself, for
> logging purposes for instance.
> ---
>  drivers/of/cpu.c   | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h |  3 +++
>  2 files changed, 43 insertions(+)
>
> diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
> index 5214dc3d05ae..c2d729999a4e 100644
> --- a/drivers/of/cpu.c
> +++ b/drivers/of/cpu.c
> @@ -173,6 +173,46 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
>  }
>  EXPORT_SYMBOL(of_cpu_node_to_id);
>
> +/**
> + * of_cpu_phandle_to_id: Get the logical CPU number for a given device_n=
ode
> + *
> + * @node: Pointer to the device_node containing CPU phandle.
> + * @cpu_np: Pointer to the device_node for CPU.
> + * @prop: String of property holding the phandle.
> + *
> + * Return: The logical CPU number of the given CPU device_node or -ENODE=
V if
> + * the CPU is not found. If the property is not found, it returns -1. On
> + * success, cpu_np will always point to the retrieved CPU device_node.
> + */
> +int of_cpu_phandle_to_id(const struct device_node *node,
> +                        const struct device_node *cpu_np,

This needs to 'struct device_node **cpu_np' to actually work.

> +                        const char * prop)

I think prop here is always 'cpus' or 'cpu', so we can just try both
rather than passing it in. A node is not going to have both. With
'cpus', you need to provide the index.

> +{
> +       bool found =3D false;
> +       int cpu, ret;
> +       struct device_node *np;
> +       struct of_phandle_args args;
> +
> +       if (!node || !prop)
> +               return -1;
> +
> +       ret =3D of_parse_phandle_with_args(node, prop, NULL, 0, &args);
> +       if (ret < 0)
> +               return ret;
> +
> +       cpu_np =3D args.np;
> +       for_each_possible_cpu(cpu) {
> +               np =3D of_cpu_device_node_get(cpu);
> +               found =3D (cpu_np =3D=3D np);
> +               of_node_put(np);
> +               if (found)
> +                       return cpu;
> +       }

This loop is just of_cpu_node_to_id(), use it here.


> +
> +       return -ENODEV;
> +}
> +EXPORT_SYMBOL(of_cpu_phandle_to_id);
> +
>  /**
>   * of_get_cpu_state_node - Get CPU's idle state node at the given index
>   *
> diff --git a/include/linux/of.h b/include/linux/of.h
> index eaf0e2a2b75c..5e51e57478b1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -360,6 +360,9 @@ extern const void *of_get_property(const struct devic=
e_node *node,
>  extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread=
);
>  extern struct device_node *of_cpu_device_node_get(int cpu);
>  extern int of_cpu_node_to_id(struct device_node *np);
> +extern int of_cpu_phandle_to_id(const struct device_node *np,
> +                               const struct device_node *cpu_np,
> +                               const char *propname);

You need an empty static inline version.

>  extern struct device_node *of_get_next_cpu_node(struct device_node *prev=
);
>  extern struct device_node *of_get_cpu_state_node(const struct device_nod=
e *cpu_node,
>                                                  int index);
> --
> 2.43.0
>

