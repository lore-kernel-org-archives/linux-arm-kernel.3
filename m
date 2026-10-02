Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0995CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv+98DicCIRnEF3119JyH5gfzpLGnB1aciy5iGQ8ki4=; b=1NbrVmReIpJvEWNOchRJBXXrNk
	Ruk0q3+L7OE85Q7B+uK5eyTiCnhyaGgC6O98eW9yWhJ+BptYNuhHDRSqDta7uYO7jflwpKpTfviBk
	vh33+EZ5sWce0bfeDuNIqu/gEzRrGmDAUTyI6+DNy2+djMo1sDDrsPC3t/2zW8pqw51MKHqa1+51+
	Egu7h19DT2n+K/nk9DtWutPIRQt4lKAsA4POtkvxk/InpOB894c8vLMYj6xY+XBn+YlhpDTRCwIS3
	3A0o5HBRxzE4OhLosh6VE5a0L93ZuzRmCs5pHdjqk7ONvoz45kMWa5EPXFTanLkxOjJk0h8JBxhRT
	Us49R23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZYI-0000000B8or-3ZCj;
	Fri, 02 Oct 2026 09:27:38 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZYF-0000000B8no-42PB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:27:37 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso76570895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790933254; x=1791538054; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv+98DicCIRnEF3119JyH5gfzpLGnB1aciy5iGQ8ki4=;
        b=kaWi+t3LqfOHusmZUkkfRwXhcnaRcdwZiSM13QQCMMcYdQfPcd7M7tf0esKded5dM2
         81LnZjL/5WtJU3tJRTG5BV8AIANWC1T8LVUuUFTNP9DG1XD/YZPc/lWRsyz+V1s0VPbW
         8KocfocwxBjeMZdwMbEPhOzGfwtmDZ0wI1DM9duy4WdPe0rkeAYPn2BoFmt6r9HqNuk6
         9kJeTg0LOci3v/zGWQjbEr1/g201TmkMau+08v2n1h2cyL5b/brgeE1j5N84ZAL3QTvw
         FgCCZc1EahK7rORMqsVjmov7i4PF4DvqMVjldbAYtIR+yDUfhIMqrSvb2gaKerLsnJed
         PUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933254; x=1791538054;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv+98DicCIRnEF3119JyH5gfzpLGnB1aciy5iGQ8ki4=;
        b=lOti+jpamK2RClsnrLSemJCWyirgL9D3uwz+VvLM89pzQjNVNpHVq38nkbQP2EhWbX
         mWFGpindy6Zs1m9/9r61/w86GcnoIGj5rujtSSaDiK+VtS9Xy14DWxeSS5vNwq0eu6j8
         oNq3XdJocEXsk0+q1/ctEAyBFZlbAD1UBNTh5fKxHmqmH4scev6QgK0u59JjHKl5r9Be
         Jv3OkUTOgI3+jRPbX0g5mhDRybBYquTWeeirjtvPLE7qqIkmYGHiS3+8YuXzlLOArCoE
         gr2b3jl/40iKcYb8FswRVv1zfZjt/u+O98lY7CWemxUIPRcozrdht/x2M1JFb7ItAyr9
         3Y5Q==
X-Forwarded-Encrypted: i=1; AKwUvByPkV3IiaE9R0z1SLsrPsfSerH0pEnaq+7catjPUC04vgXlDNOj65W85zuipgiF3pUJujHjBMZFX8N+03gxC9hV@lists.infradead.org
X-Gm-Message-State: AFuF++lTWHXuuPGXA9l62yHZjBU7bw0UTrUzH8L9YPZ+LWg8gSXocF6g
	oo5TV5ZnNoulh4Gj/0C0yvIUJe3T3fMMgRWePFqRNKMwuSkuNKQteUtC6sTgpvfUr3Y=
X-Gm-Gg: AYBFou1DnsKZG/BYua6MuYEydHsaihqMuHHOK4DyiGlBwq/wMuSogYcddPb/lFkywjQ
	8v6uPpNzfG4nnx7HeEBJpNicDluf1SeqzA3JgQhflEK2cQhG029MpYI8dfMf5PMDCzjc3ihbpLR
	HdFtWRnIY77rd2SCh16epWBEw94Ne5G73mR0Hx+tEe19jjqYoqTHdiZntfXsOZ1to7/ukTVwQFe
	MG2qBs0mpEy6mokPJSdEW6ia+uYyjA+xaqn3hEpZ3iDI73L2UqNM4CZnGaJFRoSslcatfwT3nEV
	7qnLc/kApc938qbm3x0Sq1ILOX/DFFEShBgMjv//fg+1NZ+2ZBfOHGa9F8fm3KLc5raMNXMYLJb
	QPxbn1fMqHVHExwfJbodUEA3P75yaKweR2J9cqXwVrJH4H6iKJiWvLSXtw30JGXLUl2EuC+IjCu
	VzDyZ8rHUZk6RMfjAcEKDMYcr/ld/TGhxx2hfg45R5pNmeC1i8RHliQxX3tNFrKKMkNXne+y6+5
	isZ84al6Fod/j8Jzx/nnIdp36TCkGhCdY1lZHGH
X-Received: by 2002:a05:600c:3501:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a02757ab71mr39372915e9.14.1790933253544;
        Fri, 02 Oct 2026 02:27:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff6a82esm22443785e9.4.2026.10.02.02.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:27:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Subject: Re: (subset) [PATCH v2 00/12] soc: amlogic: clk-measure: Add
 support for more SoCs
Message-Id: <179093325187.2295112.1596878747647292092.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:27:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_022736_028159_512CABF7 
X-CRM114-Status: GOOD (  15.59  )
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

Hi,

On Sun, 20 Sep 2026 18:25:02 +0800, Chuan Liu wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[07/12] arm64: dts: amlogic: a5: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/b937611475a0ac7e272881cdacebbeee70378ff0
[08/12] arm64: dts: amlogic: a4: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/a108ff38da17eab6b0ad9b0fe989c1be57a96d0e
[09/12] arm64: dts: amlogic: s7: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/16bdad08362bdd71b868dd02bfd19b0df99c0e97
[10/12] arm64: dts: amlogic: s7d: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/6eb7132c8fdbc84b659f919d22d988e57728aa66
[11/12] arm64: dts: amlogic: s6: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/fcc9787c5835325d89522eabaae5e2ee71fc22af
[12/12] arm64: dts: amlogic: a9: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/520766a407c236b462c59d69b3923bd30fc3b20b

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


