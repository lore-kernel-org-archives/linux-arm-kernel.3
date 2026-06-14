Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A36CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 06:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzRaFllgbJUPkQGZbFtgLbRMeFTz9N0dOaTYnx4qasw=; b=SORyrm8FosZwmn8p8KXScBfY4D
	m2XQDBVH6XRcAWcHG0Bc1/CfBzASNBCyTMcWBCtvutZfwsvrBNsQa3ka33x/tWlGVwAqnKqPYg4Wv
	LTWuAU9+YkuWrO4jQPWCwuEjM4tMXBzZpG7pQRzabxnCdl0ZSqAET+HMJXPPlwyJ2yL+Krt2Vuspz
	NeDavYRDc/5lINnbLHsTo+4pEPcHZpRwu8Ubdt6Z6CTeBDnkkkDk+Em/McWHqHUNdIudKl2yagrMF
	bLj+85t37acNKVJGb6vsYzdmoF2Ea+6sWlLoq737UNyV+bTF8MKbSE5vLWh1K1t0iBLz24UM2F9M9
	W54Rbu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdxA-0000000CmJu-0mZ3;
	Sun, 14 Jun 2026 06:04:16 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYdx6-0000000CmJW-3aK6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 06:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Nz
	RaFllgbJUPkQGZbFtgLbRMeFTz9N0dOaTYnx4qasw=; b=Fh2CbEYOo7wtwc8z1l
	yTG/mKSe2YRHnusuHVOM6Kd7dOsmZBAHEL7dlqwjE+dyPvgCVA/cyfVrHvBgXfdS
	sZR/EStm8O2l+pycmnNwVldKWxLtjRZ4/vji+KAjizMVcpcVbt02vD31J3QCdLlG
	+jxMNM0exQa5Tu1T2JYzFpK4g=
Received: from PC-4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXd8_3Qy5qUeEQDg--.47324S2;
	Sun, 14 Jun 2026 14:02:44 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: j.raczynski@samsung.com
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dinghui1111@163.com,
	dinghui@lixiang.com,
	edumazet@google.com,
	kuba@kernel.org,
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
Date: Sun, 14 Jun 2026 14:02:31 +0800
Message-Id: <20260614060231.1095292-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aiaORbb0lZVxDg8L@AMDC4622.eu.corp.samsungelectronics.net>
References: <aiaORbb0lZVxDg8L@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBXd8_3Qy5qUeEQDg--.47324S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4DCry8Cw43Cw1rur4rXwb_yoW8AF43pr
	W7K3yDGwnYyr4xG3yDZr48WF1xJa9I9rW5Gw4xJrsxXw15uFnaqr4fGrWj9as7uF1vywnY
	yFWjyan7uayUJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEsjj3UUUUU=
X-Originating-IP: [220.248.55.70]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0QQ4ZGouRAQ5ggAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_230413_383085_20519A48 
X-CRM114-Status: GOOD (  14.90  )
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

At 2026-06-08 17:41:25, "Jakub Raczynski" <j.raczynski@samsung.com> wrote:
>On Thu, Jun 04, 2026 at 10:45:54PM +0800, Ding Hui wrote:
>> From: Ding Hui <dinghui@lixiang.com>
>> +	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
>> +		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf,
>> +						   queue);
>> +		if (ret) {
>> +			netdev_err(priv->dev,
>> +				   "%s: rx desc reinit failed on queue %u\n",
>> +				   __func__, queue);
>> +			mutex_unlock(&priv->lock);
>> +			rtnl_unlock();
>> +			return ret;
>> +		}
>> +	}
>
>This is not directly related to the patch, but rather stmmac_resume() itself,
>but doesn't this return and hw_setup one leave bunch of descriptor memory
>hanging and effectively leaked?
>
>> +
>>  	ret = stmmac_hw_setup(ndev);
>>  	if (ret < 0) {
>>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
>> -- 
>

You are right that both error paths leave the descriptor rings and RX
buffers allocated without an explicit cleanup. However, I prefer to call
it a memory "hanging" but not "leaked":

The memory is not permanently leaked. All RX buffers allocated in the
error path are stored in dma_conf->rx_queue[q].buf_pool[].page (or
.xdp for XSK queues), and the DMA descriptor rings themselves remain
reachable via priv->dma_conf. When the user eventually brings the
interface down, stmmac_release() -> free_dma_desc_resources() will
free everything correctly.

Maybe I should submit a follow-up patch that adds proper cleanup to
stmmac_resume()'s error paths (calling free_dma_desc_resources() and
marking the device as not running), if that would be welcome. I'd
prefer to keep it separate from this fix to keep the scope clean.

>Other than that, I don't see any obvious issues.
>

Thanks for the review.


