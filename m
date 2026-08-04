Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139EEC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=; b=FurPM86HbGUPkQGA4p60UWVplU
	6sUbg6zAXAI1AKEbqJVqmvMSKv6tpDZLuxocIx2AkPJSM8hoQ8ENaol0TQ05SqAvyrvGdxCUM5HDm
	VqAnDHp5QmssrlfMIAyAjOBqBo5DGrFr5D8UNrSU1WaF5hqDcZajcgl0Djb3M26X3O776oGX1bOwR
	loUpixPtjYFhtXb01xe9rB/+P/6357BgDPWB6svqbVpQT7oK3XsFn2vhXmhHemFo82oyqgEju22u7
	/piI8g8BYF0zJ7/ZNcYwdAezObRkOWTXEPbYvkdSPQZ77Z4YDSwS8Jno69ZutaDEphVjF0BtxyV+3
	tqxc/hsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLbx-00000002lGx-3Ay4;
	Tue, 04 Aug 2026 20:19:41 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLbt-00000002lG4-3zGx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 20:19:40 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so135611a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785874777; x=1786479577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=;
        b=Gv+JdJHcnukypVbvVlicUdJh75+jcZFwuCGcUAet2ZJKnN9W6GdrVwq9Zh8ksaU9mB
         /8+A5VDkDS1b/WM/lAqK9JV63nqcWT0YAdf47gVseE0EZaSix/e9XBcGQb+q7WO7zX+Y
         MReJP+vrCVMt6ndEAU28HGgRATCgZRvT065SKnPQSCOdzSwGrNx7ynVeOgyi5T+paRgE
         x9G6C3+YsC1Dk7GJJey7jn8nvrnfF7L2ozw+4M9vjCYsJUWPQbC6kUN+wyxwnht29Prq
         WKadNlCzjOpoO0P4BZyKWbLukoYIodarXnFHJZ1Zpa6dekXu10fyftzEvnRxxYmqEDeH
         zdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785874777; x=1786479577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=;
        b=XANZ6b90G+qqB271QZSri53rcncmH7/NgRqarpMSJpHOLXPsLroxTNnbxKu/dU8lUo
         mmAAjMNrLMXlVF7NUyANC7lxTna3wTxS1kmPQVXZG+lD1GpE3kDRVvzA9U6RpUNQD120
         GLAaB2otLAvFywcVL0VVPizT7aU33Ah9y4ebU/XQyWdLWfY2F1jMYipbzBRAPm57dOL2
         +14iHvYOrF5oAvpFApJn7PtGqPodLrdKelQXRD69XP8GaP2r5S+Tg0F21ju8rDpEbh4c
         7OAEV/JpLkn66kT8wVAfj1FFLa0eIL+1j2gNoMDDBRkF6KpQq2eL/I3Qcf0G95bUBdmG
         KXqA==
X-Forwarded-Encrypted: i=1; AHgh+RpcGLn19Mh/K9Hr0qh3SsTddJwV3dvZ4yFBwR1gszK75QHwdLqLMMemsqIjWXnSEcS4dqcxsdEMye+PsK/8bsgG@lists.infradead.org
X-Gm-Message-State: AOJu0YwleQQw9cDD5bR1BN3ovGK1n4/OqoU6nGHPhcUpAP8QMsY6K42A
	/Ptgfioe9E1cbIbKPF6e9q5Xt2Tk9TGKiQLnHl7d/+CKwcKPSo9KDFre
X-Gm-Gg: AR+sD128MtzAVRo+qLHa5V0ADpUJ1nT3154x+rdBytPj1NUG9dKUADIVmAjNa+bELy9
	mX0Lw34PQVMnUpsRbgR8gMXoUlsa2E2ZxRk2zEbDH9T2iJuIMnpzm409oRLPRBfYFAVH49F50OF
	2m/0JGu4SjatMHbyqDBWLPl+CLfldwyTiQ52SGvhNQb+k5I/1+9vO1OlehctbqzpRK0KkfZ/6vL
	6J1GlAGsz1GsZDOrIM6Kpc0+NrlM26BaHQqhxXx0lK2aWGU7yL90RFs/WQbvO+V8iUC4ZZt/rKB
	NMGs/bGXnoL4bsyMY47gNTRLka1GDVWxEXdPsTugiZ/np6hSr99mb+j7RFbpd/NE6s0EvmJRip4
	RSo+qh196We9Mpq5N9izgQOdwRRMrAFn0Q4u6mbl6ac7lYODF5DHRgOhkJwgEcClDpZCVOtXYjP
	9tXqbrD7iwSdM1c6hr4TuUUljyDNfG29sUw3Fv1eNqyjbMJFWFahSlklVsjiyp/k/g1QZgCozfz
	vqOvJWNhp0u
X-Received: by 2002:a05:6a20:d529:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cb85f4a5b8mr1402930637.33.1785874776947;
        Tue, 04 Aug 2026 13:19:36 -0700 (PDT)
Received: from localhost.localdomain ([103.179.230.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm12466072eec.1.2026.08.04.13.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:19:36 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: ryder.lee@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
Date: Tue,  4 Aug 2026 20:18:37 +0000
Message-ID: <20260804201837.2427-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <202608050123.GZC7hug7-lkp@intel.com>
References: <202608050123.GZC7hug7-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_131937_986354_1CB86326 
X-CRM114-Status: UNSURE (   8.73  )
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

Hi,

Thanks for the report. This build error was caused by an invalid function call in v1 and has been fixed in v3:
https://lore.kernel.org/all/20260728122810.3475-1-sreekuttan2156239@gmail.com/

Thanks,
Sreeraj

