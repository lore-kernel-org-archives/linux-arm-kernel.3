Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A062CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib7Ut0SfSUbe54vHfazcErQh/0J2DlD47lgc4LGMbCM=; b=MXv/Wde4My9fuQmL8pr8vb0FDP
	ScNHnWRhp7VBBSMy92dIu6DjYNfrlFItbMq62W2e3oap+VJDUci/6hteNq6FHZ/OAI2ShQpO3shDE
	csGh/1jypp9gjMXktpJuy+ym3iE4Lw4p0M+hhqdqBEV7hZ0OXSEJnHrvHjidpRYqDaTwY75ymRKct
	KrcckWc361uuMz3vYIMm+RM/FxLGLfKT7f7IQmaWG0Fhf7SiUqaicywBOYZ7koSlL89fNbCHzEsKy
	BcWn+GHGbeXOOYRNfLqLftRNYsEErrM49oI6fTbHssEbufRIvvNvbWXBFF0xbtewualnJ1Y73YsEU
	3/xS5OyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrtx-00000006u2s-19Kx;
	Fri, 29 May 2026 07:45:05 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrtu-00000006u1H-0BU4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=ib7Ut0SfSUbe54vHfazcErQh/0J2DlD47lgc4LGMbCM=;
	b=Nete6hT04hIRmZhZBhxZ4uB3g3iLGdJMNAFbsfrlKtX78aTJg9uWmNr30ZboX6
	nEqxR2S7SCF4pR0ZMcsSWWDeiC/9WLXa5RBXWlYPQo/Quu3Y9RIheNjXdQoRdqid
	JeuviavYa30MfhSup/GMzinyvBxn1y4iarh4ngePCzMcQ=
Received: from PC-YLX4CAEK.company.local (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDHv0t5Qxlqea_vAA--.36333S2;
	Fri, 29 May 2026 15:42:50 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: j.raczynski@samsung.com
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	andrew@lunn.ch,
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
Subject: Re:Re: [PATCH v2] net: stmmac: fix fatal bus error on resume by reinitializing RX buffers
Date: Fri, 29 May 2026 15:42:49 +0800
Message-Id: <20260529074249.2640274-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ahhX4lIpHwhVekMc@AMDC4622.eu.corp.samsungelectronics.net>
References: <ahhX4lIpHwhVekMc@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHv0t5Qxlqea_vAA--.36333S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry8Aw1rCFW5ur17Cw1Dtrb_yoWrGF45p3
	yYkw4DtryDGr18tws5Aw48ZFyYvayrJrW5u34DG342k3y5urnavr4aqw4Yva9rur1v9340
	qr45Z3y8CFyvvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_nmiJUUUUU=
X-Originating-IP: [220.248.55.69]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0hvP+2oZQ3uJmwAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_004502_439632_28D6D5AA 
X-CRM114-Status: GOOD (  20.30  )
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

At 2026-05-28 22:57:38, "Jakub Raczynski" <j.raczynski@samsung.com> wrote:
>On Tue, May 26, 2026 at 10:26:17AM +0800, Ding Hui wrote:
>> From: Ding Hui <dinghui@lixiang.com>
>> +		} else {
>> +			/* Theoretically unreachable: napi_disable() in
>> +			 * stmmac_suspend() ensures all initialized slots
>> +			 * have a valid page before we get here.
>> +			 * Defensive check only.
>> +			 */
>> +			if (!buf->page)
>> +				continue;
>> +
>> +			stmmac_set_desc_addr(priv, p, buf->addr);
>> +			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
>> +						 priv->sph_active &&
>> +						 buf->sec_page);
>
>It this generally sufficient?  Or, in fact, isn't that overkill?
>stmmac_rx_refill() generally does a bit more preparation of descriptors.

You are right that stmmac_rx_refill() does more work — it allocates new
pages and maps them. The key difference here is that in v2 we intentionally
keep all RX buffers alive across suspend/resume, so no allocation is needed.
The only thing that needs to be restored is the buffer address fields in the
descriptors, which were overwritten by hardware write-back.

>The issue seems to be that during suspend there is mismatch,
>caused by writeback format, between rx_dirty and rx_cur pointers and
>there is bad handling of this case, since there is no verification
>of leftover stuff and there will be leftover bad address crashing platform.
>So stmmac needs to refill/reinit descriptors that were consumed but not
>refilled. So isn't going through whole dma_rx_size overkill?
>Wouldn't it be better to iterate over buffer from cur_rx as long as descriptors
>are 0 and only apply refill to those corrupted?

Actually, The hardware may have consumed additional descriptors in the window
between stmmac_disable_all_queues() and stmmac_stop_all_dma(), so cur_rx can lag
behind the hardware's actual position. So maybe not only the descriptors between
rx_dirty and rx_cur pointers need to be refilled. 
You are right that we should only refill the consumed descriptors. But checking the
OWN bit requires a new lightweight get_rx_owner() helper across all descriptor
variants (dwmac4, dwxgmac2, norm_desc, enh_desc), adding complexity for marginal gain.

>Could you paste panic that occurs during this issue?
>You mention "fatal bus error" which I would assume is system panic?

Apologies for the misleading wording — this does not cause a kernel panic.
The issue manifests as a Fatal Bus Error interrupt on the DMA controller.
Taking XGMAC as an example, dwxgmac2_dma_interrupt() detects XGMAC_FBE,
increments fatal_bus_error_irq, and returns tx_hard_error, which triggers
stmmac_tx_err() to stop and reset the TX DMA channel. But this has no effect
for the RX DMA engine (may be we should reset RX DMA here). The practical effect
is that the RX DMA engine halts after dereferencing the invalid buffer address,
and the network interface becomes non-functional after resume — no packets can be
received until the driver is reloaded or the device is re-probed.

To reproduce the issue on my platform:
  1. Connect the DUT and a PC, configure IP addresses so they can ping
     each other (e.g. DUT: 192.168.1.1, PC: 192.168.1.100).

  2. On the PC, start an iperf3 server:
       iperf3 -s

  3. On the DUT, start a high-rate reverse UDP stream to keep the RX DMA
     busy during suspend:
       iperf3 -c 192.168.1.100 -u -b 900M -R -t 0

  4. While iperf3 is running, trigger a suspend/resume cycle on the DUT.

  5. After resume, check the fatal_bus_error_irq counter:
       ethtool -S <iface> | grep fatal_bus_error_irq

     Without this fix the counter increments and the interface stops
     receiving packets. With this fix the counter stays at zero and
     normal operation resumes.

I will update the commit message to clarify "fatal bus error causing RX
DMA to stop".

Thanks for the review.

Ding Hui


