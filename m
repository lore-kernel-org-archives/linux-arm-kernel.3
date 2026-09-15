Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B80CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=; b=Et81nMgoBRDqlcMkCBdSsu53yx
	tAfoEquTUZcDjdIcaLXfv62xLxNyl8picvwLQAar80gxY5ZjX2v8ymhgbzsdJcNw4hqK6KYHH8ack
	ANTnUxMsvALzU4D1s1WjB8OuG8gTX2nvRz+yUWIMjSsmVZ7/gN4t5I+3bV4BgwE3KPkuFTX8KZDqs
	75YoDXcgx13dd+dnFuIEHKEtwIaxFmHyNsKC5d1ExjpcRkHUH2yyz3Iz8rgZXyRY8suA6XifXlEro
	uEfgJEQYkuLSFB6zqMxCo9Dq/2KObuZwIIST2tT/3byDVpnwvKaWVK6BlEpwYjYIzf7ROCjn6amfx
	77Ty/vFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HqW-00000004wfN-1l3s;
	Tue, 15 Sep 2026 01:20:28 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HqQ-00000004wed-0AXi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:20:26 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb76ef19aso30301011cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435221; x=1790040021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=;
        b=bQX6F5p6Q+mv8IbyAN2ulFCW2RkkbQAC5CNdAvTLQYpcvgF8APbAV7xWyK37yk7lpZ
         Ic0SmTfeco6iky4VQXLsdx6CjuagyYK9vr/AwSPsrPxS67qcAKbZy4jV/A5y/IqWjoYC
         sz/k57OJjyqtHce7Mu+kYqWfzs+zJK0tkcbedRkLfRC3zJjz6q8+K1jUrnNgdkdKGZDK
         NP4J1NKe6FjhiblJiS0CIGhuUk5r37Xh4nLCxBGRAHtC/4Tmrxb7HBHZCF3vZM9D1Skf
         neOzFaj4p3JSI3KklPp4tvFfWNiiSjVyIpA2rOk4TfJYAWxG62l0EdnR0o7jbD8X/e0B
         3eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435221; x=1790040021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=;
        b=LnxzM6yQYXYZqXt2CGSnqQ0LxGEqMv/s7gbRns3tQE5o6/ddsNiGSJap20iWeWqhbx
         evySNlUDpaksL+9u4KUIOvDkHV9SNPyvAVap08t2g/TsXQ0tlLpp+A0LtwOfee5wKQyF
         oOvzwv7oSDPmiicAyobjQhIHCqdHalYstG3bJh6HN7o4y0jg92us276Hrq2wrVbhJghw
         8LUGYksq2mmuSpmW4AytKv0VRv4/1GxfaNnom0lUI2LvZNCs9/Or+JhEHuXQN476+guA
         /XlkP9E1SVB37QF73IQymHLXhP3QcwlPhsdUtm835sifkjfzUN/XdJRlmlqulS4JGlT7
         JlBw==
X-Forwarded-Encrypted: i=1; AKwUvBxoE07GI/RN1JUycGt2U5EFp/ttyoKXZdj7srlHzfo9tY9A5b+qz5/1oIxBOXm780Vnxlj+K/IuM7XJ2PvQDP7G@lists.infradead.org
X-Gm-Message-State: AFuF++mY5x7eBQFBjefLihOdgT8RBNse7rjcNRHqRFan6VCq8Ysaxy+V
	jmWOJ9TyAvRKpdnyM6OY56uJkQkApUO2mehasb+tePC5a5WVOZttBYY=
X-Gm-Gg: AYBFou2Vrc3mgtPpReMt204L3Td83BEY7Za1/ESxubuoLmbaGAxhUFcnLzysSLlJ5I4
	iFlj4gegxUa3atpuUxR3MM+FaIpmiBOcM7jl/SURdUUVytH51PuxWccM7nU502E1kdgO2OMXyMP
	slxX4IVSQpKJsxtJmajKMfMAPdYT300d2Ixy8GNTpV8WcKhLrf8T0yNFainbigUP5o+zI+0SO7u
	DYlZJ0xBO8AAGPWum/jVXtZHIF5vb2vHnEKl0EzMZi2Mf8rYDbmlw7j295KQJ1JGlE7yKOkXMTH
	4fZm36vqja0vIXVwsDFuAMx91E5ZKvz5v3snN/rzYLgegN2yGhSlepkLdKKjszE70Gf4QA6GkR6
	AwSyelEDT/iyxh+Lmh0ucVGt7cyCBOHAWuPciotc4eIT5LRKmTo7NhleF16fS+8UjeBrBZd9TfO
	9k3oEvk/7ljZHFufJmt7jVvPiuAIXld2bv/Cge7CbaD2WSIiiDtoz70Dlr07btDRRYj5eP+y80/
	9KZBegCVbAr3XOB4LzgkPEWn6VrLyLaMpSMKIswsZ8eUfZxCr/PhbuvIyDKy5qwwtmy0b3ew/QL
	WPVZZyPEFzlbsqGH+4rkBYX0WPHkRhUIKhVs5Lm5uPMQLzXG4fiwIBSocBuBvcl/iyO7Qw==
X-Received: by 2002:a05:622a:4c8:b0:530:1613:e09e with SMTP id d75a77b69052e-5310cf14c2cmr70974781cf.1.1789435220207;
        Mon, 14 Sep 2026 18:20:20 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:18 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/4] usb: ohci: Balance controller wakeup on cleanup
Date: Mon, 14 Sep 2026 21:20:07 -0400
Message-ID: <20260915012011.61874-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_182022_084892_F2D61BDE 
X-CRM114-Status: UNSURE (   6.75  )
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

These four independent fixes disable controller wakeup after HCD removal
in the DA8xx, S3C2410, SPEAr and ST drivers. DA8xx also needs the same
cleanup when notifier registration fails after the HCD is added.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Assisted-by: LLM

Myeonghun Pak (4):
  usb: ohci-da8xx: disable controller wakeup on cleanup
  usb: ohci-s3c2410: disable controller wakeup on removal
  usb: ohci-spear: disable controller wakeup on removal
  usb: ohci-st: disable controller wakeup on removal

