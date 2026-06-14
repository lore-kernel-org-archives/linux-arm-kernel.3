Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3197ACD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 06:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6UuS0kzMForj/4DigAMdegzm+Yyq511CmAEpPSByMk=; b=j+/Y2ZWm9paFF5A1xYJRLMHp1i
	fq2ajG32K2IWuZBXxC1U2m+dXoxjdY8p1PF0ek+CCmwrqcDHNXLF4vBZs5SFdzsjcMNjdEewdt4Lo
	TXG7Om/xfbGCQMqK4r9Qxl5z5V6G6VjOHbj2BBooLz6kqHbeVhjrVtYzeQvukvpNWrK3A9Y4Fuk54
	KPpXVFHXMh+8vHOrvUGOrD4sy85O2/R3MRJy5ptKPwne1v+Uu1VRmG1QX8CLZVLMVHbROemcqfAjy
	cCackOURG65+z2bmT6SqgyvI7+I578BEsx4AoZin/8WhLMtV4Bq7c/f7F5h6ZYoPao9bHIMIk1E1D
	tWnF3Z1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYe8G-0000000CmXu-0Rle;
	Sun, 14 Jun 2026 06:15:44 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYe8C-0000000CmXY-1TPz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 06:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=h6
	UuS0kzMForj/4DigAMdegzm+Yyq511CmAEpPSByMk=; b=XamlYa/HwgBstmOZK+
	d1Hyo0tpNXiNK+tBdxY7FPQWH/JqqGszS4T+01JymI4QshyEdbbvsNps1JB1RvtS
	DL/ugjCmxWgSj6yBbqfCJMyP1j1ZjvnWEUdFik02toMWQ9yaAjfciucdKKSt7vX9
	TPZZjW2i6bsopIpwrQz6eOkLw=
Received: from PC-4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCHwGq9Ri5q3ywFDQ--.46614S2;
	Sun, 14 Jun 2026 14:14:36 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: kuba@kernel.org
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dinghui1111@163.com,
	dinghui@lixiang.com,
	edumazet@google.com,
	j.raczynski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	liuxuanjun@lixiang.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rmk+kernel@armlinux.org.uk,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com
Subject: Re:Re: [PATCH v3] net: stmmac: fix fatal bus error on resume by reinitializing RX buffers
Date: Sun, 14 Jun 2026 14:14:20 +0800
Message-Id: <20260614061420.1156099-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608193059.78e05dce@kernel.org>
References: <20260608193059.78e05dce@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHwGq9Ri5q3ywFDQ--.46614S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4kGw1fXF4xur43AF43KFg_yoWxZFgE9r
	sFgwn7XrWDtFy5JF90kr43uFWq9F47Jr90q3WUJF90kF97Gas3ZF9xCr9IvF1kWrn2vFnF
	krnFgFyxGry7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRC380DUUUUU==
X-Originating-IP: [220.248.55.70]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0QzqF2ouRsxldgAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_231540_760194_B9E7691C 
X-CRM114-Status: UNSURE (   5.85  )
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

At 2026-06-09 10:30:59, "Jakub Kicinski" <kuba@kernel.org> wrote:
>On Thu,  4 Jun 2026 22:45:54 +0800 Ding Hui wrote:
>> +/**
>> + * stmmac_reinit_rx_descriptors - re-program RX descriptor buffer addresses
>> + *				   after stmmac_clear_descriptors()
>> + * @priv: driver private structure
>> + * @dma_conf: structure holding the dma data
>> + * @queue: RX queue index
>
>nit:
>
>kernel-doc script says:
>
>Warning: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1733 No description found for return value of 'stmmac_reinit_rx_descriptors'
>
>You need a Returns: statement in this kdoc
>-- 
>pw-bot: cr

Sorry for late reply. I will update a new version for it. Thanks.


