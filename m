Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D56D29DE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4XBvo9hLhqjOo/eKnVRLKDXh9Sql68mRuoY6ThvJY8=; b=jkt3KVoBDi7vKySIa9AJwkrgMM
	SUl6eomffWITQwizvInIWH1fYQLjbY8rD8GfexOgndGoeIa7WY8a0lL1os73juCm3+kJU6cJAXzdN
	ExBkXAAkH/j+tkUvDTM+EIEKkiPGX6U8D30mtF80A6HriKeHwjUqeIMQvqii+cL9hkESQbd8+euLI
	OXXT2zKEhh50tnwWIwLV1Ac/FVqrfxNrs2splry5fNMlZ11+W5z2De+4bWs/+Q70w8D5GG6zXYRMR
	E5D8GRu4HoGw/ZIOFNfyeUADxW99tfvgsMoi6lofVs88oD77EW8yo06E4Ci8H871gY4wRq5TavVSG
	at46d6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZKy-00000006hCo-3KVS;
	Tue, 13 Jan 2026 08:01:12 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZKw-00000006hC6-1UDz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:01:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47774d3536dso52388465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 00:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768291268; x=1768896068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4XBvo9hLhqjOo/eKnVRLKDXh9Sql68mRuoY6ThvJY8=;
        b=K8Jb0DQ4qDGhPNDtxc6RCk4TbTccZJQjlWsJmgBwcJAu8FwiFlAW6r5xPq9gYAHQn+
         fwJIfxR84xi/WzoLqDb0oK9ZdpRFyLqfPhJwJ1h0zToWqiZxfroCvFh0oVwpojNeu6I/
         78dCVCx+7WP+V8zRG9qSN2MBVyTwTT+g1IBshX/vKLOtJ9rjWmLDqLdTdDSBvv9ajY65
         IpXHr3GV2H32UyD5A1niAs9xjFioW0GjjzC/WV/Q2RR51o+qAti29ZBp93qifp3POf+0
         ymF2J8CZl0MWzWOd9RoJU8wNHwjqT4wFz5uYvVBFKCNa3vPIJKV3a2jBZmZw0SHSXLRw
         rYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291268; x=1768896068;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4XBvo9hLhqjOo/eKnVRLKDXh9Sql68mRuoY6ThvJY8=;
        b=fAJQisZG7Q1pMMyEpu3bxpFvjiHNH7VIbY4puVVcMnfCJCMu96tx/yeOSlAcH6DpL0
         gRvvoEEqnDd4dc7KZzKmjI3XJJmFyZP0A5gNj5iJS4TqYsWDU+l9cyzZSDnTnnVwPF4U
         i5QvHcDjGwtR0RBanKmHTsp6drs+RbhJSwhlLpggQ+35/RpkeigtRubB1jG7z5KgjTvz
         8dDZADpZ6D6TZB61J67DVG8zr8itHtTyOzzXYzsnsWYddlSyeKdpuH9s+Aa9wLH/af1L
         NSjcStWXTJ3aXuuBB+U7Np+BXKlPKrMsOebyWeI39xNbbmKcd4mEpmCa8aHIMlCS0M83
         8kCA==
X-Gm-Message-State: AOJu0YxSAXyLrLXSAM4Wkjr4ifTsXMH2wHcG0hj93e4e4TzI9BdQ+QuK
	0+WffLUMwF625tt7k9d1twVrMuuyoXLsJ6PeviKZiYQh8YEv2gDf9CUxS3gtd57KEno=
X-Gm-Gg: AY/fxX5Br9cTG2OanhzE/rZpxh98p6dpx2+f8OarziqHKd2RyDxqKH/7oKY6+Yifacq
	Xo09oRbNfyQKGvgCCYrqkWma5QK3k/oA7A89pUDHhKFkX8RRmgkZvkI/WEjPDXWjSr9v1I6IqE0
	Af16xyNCe4XViaGmPj0sL5p96FOS1djPbbYL/eqlWXUaXJJfDXowLJSVcdgFMVVU09cJFvVj59X
	finmrEreVeGV+9SCWep/q/Y0XeFhEt/afVNS4PgeDdv8ErznYjpvsZaeEPkOqawx9TuLuzIxJn1
	hUvQN9yrZ4Pk/5OBq+wgWhs6jlcGQRJdnWjsqRNPVYFgqV+0Zc2s9DuIjxcWwX9fzEbXM2PsyDO
	33kMhKYOSP1Wg0PEmTT+J8EIJzrCn11FKOECUocpgVHM6Yj0HzrXWRs6JgpqPq5749gHN3ay9zD
	MkenlJuX06cjVUKn7ZUF4=
X-Google-Smtp-Source: AGHT+IEfNL67lDlJu2bZvpORWFuC/UNgw2RJDGC9kVaQZva+lj1qWcsb+L91+Qwff3hAYzlXikNsrg==
X-Received: by 2002:a05:600c:8b44:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-47ed7c2afd2mr23274545e9.17.1768291268239;
        Tue, 13 Jan 2026 00:01:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::e97c:97dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8384646fsm358516415e9.15.2026.01.13.00.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260109210217.828961-1-martin.blumenstingl@googlemail.com>
References: <20260109210217.828961-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: move CPU OPP table and clock
 assignment to SoC.dtsi
Message-Id: <176829126747.3571714.16601287953745000295.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 09:01:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_000110_444101_7063E32F 
X-CRM114-Status: GOOD (  12.05  )
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

On Fri, 09 Jan 2026 22:02:17 +0100, Martin Blumenstingl wrote:
> Move the assignment of the CPU clocks and the CPU OPP table(s) from
> board.dts to SoC.dtsi to reduce the code duplication.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: move CPU OPP table and clock assignment to SoC.dtsi
      https://git.kernel.org/amlogic/c/d7b70ebf2bf4a9983fe64b8c221db55f15c4c56c

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


