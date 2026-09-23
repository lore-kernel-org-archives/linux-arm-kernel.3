Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55B1C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1BjnqYpjwmja07iXCEPtn9ejJYfXOgfMkya7BEEYuk=; b=Fefh0cyGzRsjBA0UlX5ZQHa/XT
	X97Givw0qUc7kZ0Qfe5AlzWHtxpQ4Sd8+S1TJmhfJGdfrZhHdo04HC17ENAGU8oPW7KbUMRScgxCK
	dKhXYxCDyhpK5WhSnyYuJiA9S04oEuGJGwEreJH/yBLB+ny01SwQ2CUsShdSfeA3VmqxRF8YXWM5W
	SkuGf1EFs9lkHLaO6pXvSXuJe3BqYa4AVPjq9Oh3bURSGXwThEAF/uY4lKH2oo8cfQS0ClXF+rROA
	/aWWNYTA05S4l6UUjcm4YTFbqFLr4YuxZa82YCtuv6J9VckC1f00V+RkN3+39y6svJEJyJFmvcw7S
	0pJnqP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ClT-00000006wZw-0Exj;
	Wed, 23 Sep 2026 02:31:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ClR-00000006wZi-03kJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 02:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E1BjnqYpjwmja07iXCEPtn9ejJYfXOgfMkya7BEEYuk=; b=DUciXOd6aMNJ0quajC92uWVWrh
	7Vwnp3MXLCt/aadAIajFkFAIlmiShiMJsddwPnjzH1FwyUDn+2nRL/Hn8EeUfccra6jgHhoTh0WA4
	Sv8mCpgLEODuVrgjJUS8iKholpurHvTwSv7KDCjrPexLloH6MN6JCc/GEPluTp2c6tj3Zwj6XiHtu
	T/23fE+Ip/7vHpNnHbYT116Tm8SUuPuK9qSwtlnjFLMeD0TDG9ZCcz0R82L4hktVmV/54JU5NPdjs
	1RuKVhy/NULGYob6XicGs7LH+xIoFCKeSESsYm83l8qTzpDoSijS/0JcmTbPMym/ffhQ1rNpYsPuj
	/bsvT0Ew==;
Received: from m16.mail.163.com ([117.135.210.2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9ClM-0000000EHYq-1eO4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 02:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=E1
	BjnqYpjwmja07iXCEPtn9ejJYfXOgfMkya7BEEYuk=; b=G0Zz+CVQrGAS8qp0T0
	GJxnlSxeHeX28d2JGDE4SQvnFDNSqbRP09sUgsuL9n3rQCVIA0+OmXe2xtgl862M
	MLqWqIVdKNDmZ4M2JMXw5xSGFsc7sR3STVpgGHu+/bu/uwXuiQW0rAhQNG3Nz/7H
	4Yy841//W8R1YoNX7torVfrGY=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnD9jWObNqbG79AA--.45419S2;
	Wed, 23 Sep 2026 10:30:47 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: Re: [PATCH v2] dt-bindings: arm: vexpress: drop the obsolete hwmon and regulator text files
Date: Wed, 23 Sep 2026 10:30:36 +0800
Message-ID: <20260923023036.352192-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922091636.A5A401F000FF@smtp.kernel.org>
References: <20260922091636.A5A401F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnD9jWObNqbG79AA--.45419S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWrXF1kCr4xuw15ZryxXwb_yoW3urcEkF
	93Ar18G3y5tFsYgFyYkFnakr97G3WSyF93XrsFqr4Skr92kFsxGr93G3sxuryIga1Uur1D
	WFZ5Ww40v34jgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjsNVDUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC4xcLgGqzOddpagAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_033113_541484_6AC0E01F 
X-CRM114-Status: UNSURE (   9.19  )
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

Yes, that is right, and it is what 1/2 of this series does.

Documentation/hwmon/vexpress.rst carries that reference because nothing had
pointed it at the schema yet. Patch 1/2 replaces it with
Documentation/devicetree/bindings/arm/vexpress-config.yaml:

  https://lore.kernel.org/all/20260917115818.540344-1-quchaosheng000406@163.com/

Guenter applied 1/2 to the hwmon tree on 09-18, so the link does not dangle
once both are in. 1/2 has to land before 2/2, otherwise there is a window
where the reference points at a deleted file. That is the only ordering
constraint between the two.

I ran the grep I should have run before posting, and it confirms there is
nothing else: the reference in hwmon/vexpress.rst was the only one left in
the tree besides the two files themselves.

Quchaosheng


