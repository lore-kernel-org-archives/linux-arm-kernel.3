Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2952CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCXWz/1upVMwUQ+jcjFf43qR2pwJTe9lFoP3kpo8Wgo=; b=s1sMaE+0zKT4cWOrt7R2gQEn4N
	/7ojkVQaczyGcZ79W+MyxYgKuwT4KJlNYkEqU5klLmuInJNOPzw12dO2qhdDd2VcgLORnfsp/MCY5
	5CWlPL+TZKxPkpUv1xEoqf0qXMgB+kdP6TTCFVDLJhfJTmeFJfUsy7smLIm4lrqpctilIQ/6K91HH
	j4VWwCt4NbbgUchJjtI1grJdBnIbZq+/JBIPyX109GRJGFKbY84V/3tQDZmhft717GQjkH7ffOvbW
	lAq1q84owuselGtF/XOikgecqq/QdiQ6nhy9MHuN/ez7/iWowdglE9tdfW2LMNjphcD1hiaspYb9g
	dkpRJUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pam-0000000C5iJ-48V5;
	Thu, 24 Sep 2026 19:58:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9paA-0000000C5Lu-1yon
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 19:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uCXWz/1upVMwUQ+jcjFf43qR2pwJTe9lFoP3kpo8Wgo=; b=D5JKbdy9S+UOZDEAE3asYTsdbV
	1JmXr2wXDDx1a6CB6aaO38BFAKeBN/W1zSgJnEUsDxrbbKeiv00+2Y2V3MzgulMAoShBIpsGIoVpS
	v59wSFeOSLScy6NFb3kyUxHnonZzABsnVGZYup0mjK2sPP6y3Dq28kPn5ZSZdlEFE32SNsVY+9OjD
	e1Rgxc6hEpgrIgrSYprZI9Krfxu/lnsN2N2TbMJGMAmze9AtvhMfRlTMlfrn9pM9658zRWuKSBFTp
	7ZMVAHSoZdwAEVr3nxsJ5q4O0T2/pTLMz7Fb9Cph1XTXsLTNR/9qq3TdzvLrOo8YKnbxO47XWxy/v
	cBDPJBzw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9pa7-0000000GNr4-09ZO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790279891; x=1821815891;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=f1Jl7ARCrnbvOaZkK/LjDTX3tw1/5r96ssNQoJplEUQ=;
  b=PG0wGMCrUBCsKideM7OBQHKe79Vgwvya5SEI4A4lAnDmWjR9LuqsPE47
   aT5abxu0Z76elYEXyj/fgvYl1UnIHmKJK3Oy+R9mQha4+onToT/rJGNbi
   h8Awsn2Bh7S+GgLtAQwayjOAY4QCQvdZUKyk4euzKUJmr+rzKYch+n+mh
   CBk4sMp0PG2Z+VCphnWHcDSScuzTNSw0uObuFDTJaR+ht6erGcBZ+JKDz
   aXzg1fo62H+Dnx5797sbzfk39x/YWGTQjhJirS/sZzXUsCR+tG7+XrLub
   Tm0NRVE6WSvPN5S9btXpXLcDG2O5NdHz6C+hzP9am2qOOuwCp1oKakX6+
   w==;
X-CSE-ConnectionGUID: t3UEfPi8TTO8/B3fdvd7jA==
X-CSE-MsgGUID: j6ks3an0QcOcMOgW2tdqPw==
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="295533236"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Sep 2026 12:58:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 24 Sep 2026 12:58:08 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 24 Sep 2026 12:58:04 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Sep 2026 21:57:03 +0200
Subject: [PATCH net-next v8 15/15] misc: lan966x-pci: dts: add fdma
 interrupt to overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260924-lan966x-pci-fdma-v8-15-201c7b707d8b@microchip.com>
References: <20260924-lan966x-pci-fdma-v8-0-201c7b707d8b@microchip.com>
In-Reply-To: <20260924-lan966x-pci-fdma-v8-0-201c7b707d8b@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>, "Simon Horman" <horms@kernel.org>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_205811_637945_0AB2CC34 
X-CRM114-Status: GOOD (  10.88  )
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

Add the fdma interrupt (OIC interrupt 14) to the lan966x PCI device
tree overlay, enabling FDMA-based frame injection/extraction when
the switch is connected over PCIe.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/misc/lan966x_pci.dtso | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 7bb726550caf..5bb12dbc0843 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -141,8 +141,9 @@ switch: switch@e0000000 {
 
 					interrupt-parent = <&oic>;
 					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
+						     <14 IRQ_TYPE_LEVEL_HIGH>,
 						     <9 IRQ_TYPE_LEVEL_HIGH>;
-					interrupt-names = "xtr", "ana";
+					interrupt-names = "xtr", "fdma", "ana";
 
 					resets = <&reset 0>;
 					reset-names = "switch";

-- 
2.34.1


