Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35F4D58E74
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0DvkusmHOW0eAtj9h394cx75bzGqTGWptRTZ1deWHs=; b=nt8C97UZ8dSp/QxbzqarLNSiia
	rchM9R04gZxi7X4Eadchtc9IGyk7GAyC5fWvXatBkUUryl45/ABrN+HhbMfKviDicYi/t82+53bYO
	TkUaS8HwqqDHfuYOMiO26IHG5qub6iKhqukkM48U6y524dKYwmhjmozHr4zx5MnZLtdEhjUtRZJyo
	B7k3eROyecnfeniiVi3pojNqdR8R4U3cmMMTxNr+cBSvY+6fOEXPmBlCvbXGAgF7gKA/45EtrmeZV
	SVnBrB95j1rmB1C6duhHtEVnuOIH4DDpBsfeNNVhJ9KhbEkeoeftVS4Kcw/u2rzDiKwTM+Q41Wf18
	a+bbD4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxWz-0000000COn1-17yN;
	Mon, 02 Mar 2026 07:17:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxWw-0000000COlz-2Nn6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B39C34023C;
	Mon,  2 Mar 2026 07:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105E7C19423;
	Mon,  2 Mar 2026 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772435845;
	bh=nC9zUAdvD57JDzh2FtofV4kQc/xhANpYc2J4dZGO+CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KynI8oG7xJDbSIapO2jljCT1/hzpe3eF6EBa1eEVUBnpcxcdGWRDVGTqnIjxtT6xO
	 WY4SSi9PqduFL+qdps6MpwVplRWn/5uQ4yIvja6IU2yzqqjEUnQc/6jV5e6q/k38cL
	 zpqVU4iRvsG0AUF1DmyI/62iLvQpHR0MkgM/WTgwcK+77Tx2ymTpWsUUI3QPsLy6ps
	 weSbhkFkvoaTiTGFK+aias4QdXgfNYMpn97Ua3uZ2VnvOZiLTmpBKBsvGmx7Rd4XBB
	 pnyKRH0sj7e61q5FZfYCh/Gd6HBEZB45EJtsEPdjRiPxCzg226by8HPonVCB7C8/zx
	 LrW3xHZFy01ow==
Date: Mon, 2 Mar 2026 08:17:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
Message-ID: <20260302-rousing-finch-of-drizzle-af53b9@quoll>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-6-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-6-22c458b9ac68@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_231726_696348_4015238D 
X-CRM114-Status: GOOD (  10.97  )
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

On Sun, Mar 01, 2026 at 06:51:20PM +0100, David Heidelberg wrote:
> FTS may have associated reset GPIO, document it.

Commit msg is wrong. May have or have? Hardware is fixed, unless you add
the GPIO for driver which does not exist in the hardware.

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Best regards,
Krzysztof


