Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A071FCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZevPFZWYMUUhq47/UQyoxjI9SWdGG7Ind6IJjxpI3Y=; b=Z/q02ycAGS5c7GphdMy0TciAJv
	+IcM4vaVdelsV9KqROpU8F4fmd+aJdWSuUVTYybNaZQXaX4KYG3JjUFRO569Xar7J5R69HiZlH1B6
	0KbU2VVC7mVno8+TsPqmvOBMHX8dmxkHkHihSEKjlTQN+nhOcl5sK5aKALQbAGako9avxZfYd+TsG
	k4F5rvWLFds/AMfYZyT/aXC321EMYnvm6sBEOu8Dc3Lc2x7U4RoabblhX3t7QaR+BE3Z0Bijq7bhC
	XdPw3yC36++5tA4JsiVe9/VE3KgJImYh1DI8hktvSw+B5MmdFw6DQi3Wbhv75978292g2+035ZI8l
	s+zr9j8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGdm-00000007Ti6-0xmM;
	Wed, 10 Jun 2026 10:58:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGdj-00000007Tgm-1uHp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:58:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso9268382a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 03:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781089110; cv=none;
        d=google.com; s=arc-20240605;
        b=JQ9vu6F2VXO6hpcWHvDr7Cr4BY2fa/TPQ8gj0E50ySyvMa42uvd2m58BSBRcGxYuNI
         Iy3Fef7/O1cEcpZEdU6752HYapZuSDuTE1ZqQe+BMh5jlx5iazrykGYCx0Y4plapecL2
         o8azzjF5kKOTYgKOG/rqMHBQ/4Qp7SJiRu29tGJH0sX3YGoT0tnINbhZPq+KGF07X6G9
         EYyjJDwU5CA/66h0ksHYxmqG1GLrAQSH5ystTQUMTgMlfVsRPyIzYdjDFNSX0s86vIpH
         4VnjYdnQ9CZi7MslWexBK2elmxqXv13E7AhqxmlSTYaoI9kThamIayRPgPyZTF6MbrMq
         dwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CZevPFZWYMUUhq47/UQyoxjI9SWdGG7Ind6IJjxpI3Y=;
        fh=nDPbK0prrYx97w+jyeyyj0W3cq15VAcsBiMEV29OWjY=;
        b=gLt3JFhVywGVMPqiVdHrQHr68WVmqHf73hJgGKVqn9oY6Y5ACN2OXaH6lGmrBIfmav
         bCR5kAAqnk20LO6XwOqABREbJQAjdjCsZE9ZUrEvY/Ro4bjs3UbcmZpCmi8Sk+IWNUnX
         qGzfm+39uKBmHQjAz3LEqmS0dhW4GZ72uxO9UksfwR3XSMwQ0kj8DnDb6Eqwyffk3rxm
         eB58/y6rwhMHttFUlaQAaEm7vcsueRWXWTJyXBlzklxJ/bzbl/3JFtEx8qAVWxbp75GE
         n+0qFHBFS4u/5cpx0hHpuxFhKjYUwJaqfdKo5nlu9JlPEf7BAsQSnKFfT6VfTsQYKYSz
         C+Dw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781089110; x=1781693910; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CZevPFZWYMUUhq47/UQyoxjI9SWdGG7Ind6IJjxpI3Y=;
        b=slwXRF5/fu4hZXlGzjhVwo7fO1RivFTcH2piWrRFS5UgtclpYmPzMNB59tcxfsMQDR
         McCOSjswGwzfWMk8ugypv0T7Ud/kzpoU6JQbfGFMwfmdaCM/DAzTqws7DPrjOh3XE7zU
         T7k9AEC1ntHek3+atEDKerYqkpEZssIxF2OSU4HiGCbc2ctWpQHFvO7vsAnrdo08ljmO
         ZSGWHs0YGM1fsE0MrjeZObm3vYhjwLliNOMY+ybF7MId5RfhTbSHEmsGKfNq5tBf2Tec
         rIG1wUwKO/YCpL3v9PynB7JPfo6Sxz70FaISz8i+cRTOXMX/EWgO2l2j+Aqmv2mdb2gt
         obaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089110; x=1781693910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZevPFZWYMUUhq47/UQyoxjI9SWdGG7Ind6IJjxpI3Y=;
        b=X6aXbW4fyk7QJKLxeLv3hf7AjbMmBise692Sj+hSt6cpxQy1SWJJmKXZryuJsX5pa3
         xUVpq+UOjuEFCgaYxqqtuPGqMYcamF73cegjf2gJ5G3qbuXQF9LLvQdp3ZRxE6S2gBhs
         zK02QYL5yvpydquYUMXxx+PrvozqmrC/zVcnbPNZ+3CupaSNhoiVK3u4pjIlhkXYYAjx
         wmmnwmZ0Qo77FD1faA0nQxzEm0OlL72kBcskdocUkacKdCS66WBJiZ7hWZS4c7Ek05Ww
         lcRAkG2c7G4RqRCTcIq/oVildR1ZNUPHS1KFumOwBK4cd3v3T75j49vWxvUeEog0b6CH
         F78A==
X-Forwarded-Encrypted: i=1; AFNElJ9C+XTVwbArPdLYYqGjooTPdWIGclnWt/a7qNzXz1XSj/cg+rDrRXSdSEdQanjd5hdjU8hbBbnQm+MXtPvAe2aI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy49NFC4kgdFE7YsKzUo4D7NPQ2OmEsB2LizvA4vTLwl6ztsxA7
	XiC4cnfBkI6++7gOuPazu31CzeYnLd2RCKZyJ3vspzJzwA+AkFeoyqOisghcV/qU30JWPhABABu
	SAO4SdXrgTEP7cyQUX8kgp0N+jYm2Z34wob8o1Nw7+Q==
X-Gm-Gg: Acq92OGeP6+kYRiBlCu+vm/PHum0DKXM8B+jcu8onB3kcokcO25tGXVhyuxeeb7khpc
	xzMfLTxCwWjiass2v+nszzp4IS7ydL2SiLfVXQ4M6PsScuGAUWQe1V8Tf0BmnBLYebWkudQZiOO
	bUI/8nPnRbmXMO8wyPudu8Cm/7As5xXAJ641MVOTbyI72mxQr5/SpWwwrtBLJmzqOhr0r1NVxXt
	F8Pz3zB93iv2q/CHRPflGcKiHI6ITBfi/3tS/87YeJ9MyCXIbD5xDTiIpbaIIfKbYCsXr++9rcu
	J135eV3RRMtgHuEXLpMtfraIGAOXmBNfzGvC7SzkMzrOiKkXukGT
X-Received: by 2002:a05:6402:3711:b0:691:ad29:ea20 with SMTP id
 4fb4d7f45d1cf-691ad29ec32mr8237260a12.14.1781089109643; Wed, 10 Jun 2026
 03:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-2-0cd05c81a82d@linaro.org>
In-Reply-To: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-2-0cd05c81a82d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 11:58:18 +0100
X-Gm-Features: AVVi8Cc8CtqeDsBexbU73aNUL0ZdHbMknGnH8Y2ORIFe_Si6C0zGr-kM3HOWHug
Message-ID: <CADrjBPoHhiNTfBsEam+=AWVc03mbQt+E6gm5Dw0fo=pH-w4Uuw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: samsung: exynos-pmu: fix use-after-free of
 interrupt generator node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_035831_518234_EEE9198D 
X-CRM114-Status: GOOD (  21.14  )
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

Hi Alexey,

Thanks for your patch.

On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The setup_cpuhp_and_cpuidle() parses the device tree node for the
> interrupt generation block via of_parse_phandle() and decrements its
> reference count using of_node_put() immediately after fetching the resource
> address. However, later the intr_gen_node pointer is passed into
> of_syscon_register_regmap().
>
> Fix this by moving the of_node_put() invocation to after the
> of_syscon_register_regmap() call, and adding it to correct error paths.

I think  using
__free(device_node) = of_parse_phandle

would be a cleaner/simpler fix.

Peter




Peter.

>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
> Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 6e635872247a..9636287f6794 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -428,23 +428,30 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>          * syscon provided regmap.
>          */
>         ret = of_address_to_resource(intr_gen_node, 0, &intrgen_res);
> -       of_node_put(intr_gen_node);
> +       if (ret) {
> +               of_node_put(intr_gen_node);
> +               return ret;
> +       }
>
>         virt_addr = devm_ioremap(dev, intrgen_res.start,
>                                  resource_size(&intrgen_res));
> -       if (!virt_addr)
> +       if (!virt_addr) {
> +               of_node_put(intr_gen_node);
>                 return -ENOMEM;
> +       }
>
>         pmu_context->pmuintrgen = devm_regmap_init_mmio(dev, virt_addr,
>                                                         &regmap_pmu_intr);
>         if (IS_ERR(pmu_context->pmuintrgen)) {
>                 dev_err(dev, "failed to initialize pmu-intr-gen regmap\n");
> +               of_node_put(intr_gen_node);
>                 return PTR_ERR(pmu_context->pmuintrgen);
>         }
>
>         /* register custom mmio regmap with syscon */
>         ret = of_syscon_register_regmap(intr_gen_node,
>                                         pmu_context->pmuintrgen);
> +       of_node_put(intr_gen_node);
>         if (ret)
>                 return ret;
>
>
> --
> 2.51.0
>

