Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A55FFCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsXE+svD0ozIQDDFOgt45cd6eXjH7nxp9XTye3IloGc=; b=tg+9T8Z5nLmG/dfOlhwqhuh/Ud
	lBE1fXgVgx6V85Yljuq0MZ5SSAoY3sm+5ubXGHVS5b4e7ODCNRA0j7MesQot4K5sOPEhw7xC90LBo
	4h1Gx5xevOkQJcdoTZc6oLFoyLWyubrmqXc2L8999v1vmNhIOsW2EeBdiONZjhaCU+qLJ+1FTwsyy
	a7xBblE+mfLWE+u90r+AzqWe5hkd42boHWXRllX/QOpb5ItwR17gwfJGe7YCuFoS84eC64D2CB51Y
	JxERfKvzn+7RDMqA+oTGWm0O6GQyDSMZKXFbcEjYZb+u5+WElWnC9PMMhK78u/HM+lOBs/xhSTUbM
	e2nrMeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYge-00000004Cy8-37GF;
	Fri, 06 Mar 2026 17:10:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgd-00000004Cx8-3xy4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 17:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VsXE+svD0ozIQDDFOgt45cd6eXjH7nxp9XTye3IloGc=; b=onMYNOqpBrDXfse+oNeh8hDDFi
	tH8euPJP9lxXLDZa9OTxay5ebu5wUEO2/X0EcjPBk1QT6x80sWeCq0VxUTulUEXwe64Oni0xxXNGh
	UvJUKtgELiXcprkUL4JTESdngyPGEX7owwUv0CpRMjNEr39Br+wCVKF3Ri4+MwF98xeH2jAfGg19k
	AHyXD1uW+g4aFWVPqgW5mBuZX7wjg2sVVpattHq1vIMnCWbcisj83PgZmyFx5X3j1UeqEHJ5H8CEG
	COC3qg7yuAh5LkmN4Xp5L+Q9CYgHmwx9S6vkDmG+fc/6ap3L5Ki2vGJy2sHtuPb81wX0CHGPTEhi7
	GSTvhxuQ==;
Received: from www537.your-server.de ([2a01:4f8:d0a:334f::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYga-00000009JMz-13GO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VsXE+svD0ozIQDDFOgt45cd6eXjH7nxp9XTye3IloGc=; b=l9YUV9HdlLX1HfeKUqfDNoU5YI
	CXhnjJjxxN09CLqR+AHoeDH8353f4NYCDNtqXDEfiaFOjMVS4l462dWrRo+KWmhB31SnQTbSbVxI6
	IuZbWb/nuh/8t51OhOr5Jb7TkinDYH7E2qeTXj/mwjLQ9uVuXCvtsWTaGC5Jr/vO1sHx3u73RSoUy
	CFhzNduiEBY388G13kQaPZ7HCk5ToAxKoqm6QjV2AnlpPrr7bjSb2r6XnCP0xgcTmyYKcq9x+oLJL
	do97pKp8inQqRzyTOyo+PqAlaa08/Hsh/yxXEJlxrLgz3RN09y+HSieY0rW4+uQA60JCsGVoA1yh+
	SuCUKsKw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.feilke@ew.tq-group.com>)
	id 1vyYgG-000JfL-16;
	Fri, 06 Mar 2026 18:09:40 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.feilke@ew.tq-group.com>)
	id 1vyYgF-000KT5-2p;
	Fri, 06 Mar 2026 18:09:39 +0100
Message-ID: <6db90740-5a89-47dd-a789-98b96b202a1a@ew.tq-group.com>
Date: Fri, 6 Mar 2026 18:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 0/3] ARM: dts: TQMa7: modify for use in bootloaders
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
From: "Feilke, Alexander" <alexander.feilke@ew.tq-group.com>
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27932/Fri Mar  6 08:24:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_171000_356062_40B8824C 
X-CRM114-Status: UNSURE (   7.61  )
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


> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
>
> V2:
> - Updated commit messages
> - Added missing QSPI bootph properties to imx7-tqma7.dtsi
Any update on this?

