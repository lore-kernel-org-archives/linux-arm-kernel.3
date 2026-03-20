Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AC71099B34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 18:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hw2FxR2/M2uDePLGh6HRe11OssJeTxqJYbIn5ldTiU4=; b=TMirwUa1dwZ0xmdbPW7CzQpgyN
	tbJD2tPmZGK7mjlUIE3ALmw276j4miSEl8nVEbKLBI4cpVigOuGh/ZBPjNQjH7AZXCBz07tusW14C
	36irYcc9OwPyKSTvdzleRkNUMWAzxgjwTnOGI4p1Se8GTrJateJ70cE2ujIsR9NrW39O1Lg8f+HrY
	Ls0W5SyHWRvAtNfHHUBF2I4X1ds5MZjKphDu+gROW8A6LlUTDEcTjNMU0wnvYMaqWI4QxuRxWMov2
	6S15DHYL8+/zheo5nT1LxQ+9WWYqy190mOKyGJmTmIkJNKBNt1yQFLl0KAb51pv75S+S14aimkdvW
	JgmryCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eXv-0000000DNib-05hf;
	Fri, 20 Mar 2026 18:26:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eXp-0000000DNh2-36Ce
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 18:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0CBB43BE9;
	Fri, 20 Mar 2026 18:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8CEC4AF65;
	Fri, 20 Mar 2026 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774031160;
	bh=jlrQP6CtospijAjR1wos41IMDs4DAGnm2KjWl19/ukk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7m/Av3S1jBwh4aIpwIEm9YlGIP56CKhDCFlVKaRpszyu5bhjBVFk1nMZYJwhzJez
	 WYIoQT23O5DoFyFbY0THi/N9uUJoG3bs2m2Pw/jJDp4iH1FwGneZV9KKsrnJIasPAA
	 WYTJYbR/iiXAq/bDhKGeNjNg4l3ZFf3eHRU7pCk7Dmq2tcMJ4V3YBW1Ey+qmkdexAf
	 YojwZsvqmQ8jtZOmDZ4vBtUdHpmZjxdWnp375kNIbVjbEeBB/O6rrY8W32M0/keBxL
	 eCayRRMpxenf78oyEXEwT+HxMKDj+q7xHEiBXDbjBjpbMVrQhG92Q9tXyJKutnlMSc
	 YpylKX0mgne4g==
Date: Fri, 20 Mar 2026 11:26:00 -0700
From: Kees Cook <kees@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Maxime =?iso-8859-1?Q?M=E9r=E9?= <maxime.mere@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] crypto: stm32 - use list_first_entry_or_null to
 simplify cryp_find_dev
Message-ID: <202603201125.964AD89B@keescook>
References: <20260320084914.7180-3-thorsten.blum@linux.dev>
 <20260320084914.7180-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320084914.7180-4-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_112604_707163_F720BC97 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 20, 2026 at 09:49:14AM +0100, Thorsten Blum wrote:
> Use list_first_entry_or_null() to simplify stm32_cryp_find_dev() and
> remove the now-unused local variable 'struct stm32_cryp *tmp'.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

