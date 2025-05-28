Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245A3C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 04:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jP70LOWriNKBSIQGk6PZkoyhsobwrWFEeO6VgFB8rwg=; b=ZyCa9RBJyznt9jnBbq1cJ8ud1U
	0Egs6upd9biwjWgw6wIhTXAFZifbSXKrwYAXHGKSQIA6Qs0bup/u79azMLnyHLAY+F5co5gK5Ost2
	DW8ed/lSrVtBPPu+5g+HOFVFALWAStfTHDKJDrxHSr4M7n/5iG9xJGn5Lwkt8/T/ar8bZyhbgtwLp
	jPTsBzDU9emB4+iWn0SEfXHbuH5+2qpS5A/HAqVtUxjuRc9M5RDSIkBUOwZzQlIAw8hBBUr8nuWkF
	lPrkiko5EsMI2udFP6aqFAZrZrQbBzKn9qVARH14P5Vmey5z5WM/2hJeGzhA6NlpD+R3QKBga9exe
	d1ydVblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK8EU-0000000C7fU-0ohi;
	Wed, 28 May 2025 04:17:38 +0000
Received: from azure-sdnproxy.icoremail.net ([52.229.168.213])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK8CL-0000000C7Vg-1APh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 04:15:27 +0000
Received: from E0005182DT.eswin.cn (unknown [10.12.97.162])
	by app1 (Coremail) with SMTP id TAJkCgD3DQ_DjTZoOQuVAA--.6922S2;
	Wed, 28 May 2025 12:15:04 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	vladimir.oltean@nxp.com,
	rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	inochiama@gmail.com,
	jan.petrous@oss.nxp.com,
	jszhang@kernel.org,
	p.zabel@pengutronix.de,
	0x1207@gmail.com,
	boon.khai.ng@altera.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	lizhi2@eswincomputing.com,
	Shangjuan Wei <weishangjuan@eswincomputing.com>
Subject: [PATCH v2 0/2] Add driver support for Eswin eic7700 SoC ethernet controller
Date: Wed, 28 May 2025 12:14:42 +0800
Message-ID: <20250528041455.878-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgD3DQ_DjTZoOQuVAA--.6922S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4UZFy3KFy5ZFykGF4DArb_yoW8tr1kpa
	yDGFy5trn5Jr1xXws3Aa18KF95Xa97Kr43KFyfJwn3Xan8A34ktwn8KFyY9F97Cr48X3Wa
	qF1Yk343CFyqy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRifHU3UUUUU==
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_211525_634084_65FB2860 
X-CRM114-Status: GOOD (  11.70  )
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

From: Shangjuan Wei <weishangjuan@eswincomputing.com>

Updates:

  dt-bindings: ethernet: eswin: Document for EIC7700 SoC
  v1 -> v2:
    1. Remove the code related to PHY LED configuration from the MAC driver.
    2. Use phylib instead of the GPIO API in the driver to implement the PHY reset function.
    3. Align with the latest stmmac API, use the API provided by stmmac helper to refactor the driver,
       and replace or remove duplicate code.
    4. Adjust the code format and driver interfaces, such as replacing kzalloc with devm_kzalloc, etc.

  ethernet: eswin: Add eic7700 ethernet driver
  v1 -> v2:
    1. Significant errors have been corrected in the email reply for version v1.
    2. Add snps,dwmac.
    3. Chang the names of reset-names and phy-mode.
    4. Add descriptions of eswin, hsp_sp_csr, eswin, syscrg.csr, eswin, dly_hsp.reg.

  Regarding the question about delay parameters in the previous email reply, the explanation is as follows:
    Dly_hsp_reg: Configure the delay compensation register between MAC/PHY;
    Dly_param_ *: The value written to the dly_hsp_reg register at a rate of 1000/100/10, which varies due 
                  to the routing of the board;

  In addition, your bot found errors running 'make dt_binding_check' on our patch about yamllint warnings/errors,
  it looks like the validation failure is because missing eswin entry in vendor-prefixes.yaml. 
  When we run "make dt_binding_check", we get the same error. We have already added 'eswin' in the vendor-prefixes.yaml 
  file before, and the code has mentioned the community, but you have not yet integrated it.

Shangjuan Wei (2):
  dt-bindings: ethernet: eswin: Document for EIC7700 SoC
  ethernet: eswin: Add eic7700 ethernet driver

 .../bindings/net/eswin,eic7700-eth.yaml       | 200 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 410 ++++++++++++++++++
 4 files changed, 622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

-- 
2.17.1


