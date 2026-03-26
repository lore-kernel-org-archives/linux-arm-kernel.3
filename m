Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AC8109E52B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 01:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mK56nONHLvSZRp694UK1w71k4LRdzPAAGnPY2RMeLDI=; b=WCJADcKZCkYyBL3XDkGSTql2W2
	hTJGag+ZJuT+oEDnH48AxIufbZUUUN4RHvmBoco61bUnU9tLhz1byMd8OgK15leFXn/xt/Dk+xhve
	RpyUJNxRM5ZhlTg+KVQeOshABq+RSc6cavOLN+YpBOB9KZBK8cr3tqSfSjL72cDnqtj1q9M9ZpHF8
	HdxFKS0erFzxZxQEPIywD9K9AdKHjw4Cf2Y3TgGWBdn7Rh5z3ecpJ/3wA7LYMu0dGfCqfGmUc1Su8
	AOU/e7Ya5bZCb6yZGjBOaHj9oH4471V1TVo2jk6KjwMmLz9W5XUAoqMceATi956waZQcgDePtoZLU
	Y1iOQmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ZqF-00000004Xlb-1Jx4;
	Thu, 26 Mar 2026 01:48:59 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ZqC-00000004Xkp-288H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 01:48:58 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-38a2e62b893so4030971fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 18:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774489734; cv=none;
        d=google.com; s=arc-20240605;
        b=emjysosoBCG/W1NFTHXYnD12gyCbF5fkWjDdKXj+5+sywsinxSsKNswPqn2cyXOLDM
         HKGFA/E8LfTfGJFDmDlXwCieaS4kiduVtiT6U0tckqRaUDPYfDtWUR5sH+wGi7IOeIC7
         rgYhC9qE6aolKD7Gz5xNWMRTctbEKAc9gKqP+O6PAFgabF2TlppOAy8G1Q3UuYIsyeW0
         x/eLWeayEDNGWvxPtz7FjfO11aSQ6KTouzEBIf6B/D1pGBPIekuWi82RdOiRFth2xQEo
         kNCnd1lp7kzSgP4SGtF23k8tV8Ps1qxHvXD8bOAi0YBMzLJdOigcWydihe/PK44KPB0e
         I8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mK56nONHLvSZRp694UK1w71k4LRdzPAAGnPY2RMeLDI=;
        fh=XhLC3ofxNDytf1w/Zf9NgPK5cl+tMw9XBFq8aRYDUiY=;
        b=a653UVyIYREqxUgNB92ldlSllb4ftXsqfbzFd7XiRqDDs3XjjUXnv97H1PDQAt02+T
         afLUEn5zJJoFp+Y1M/xFgWrv/zc0DN3TpQBoIvIuVPDHdR5twsvF15T4wBAKG/9cdmBe
         Js6mL2PvGGwnXeoAuNVjBOMRYKknmWDaAWdeah25kiE18oJIvkukiqYhYzi+YmKzT4Yh
         u3iUOls4sfZ6xGzPl3ESpSoTU9wpfQmcJZY/QX/Lrv4rMUieDXbZHX90mpARbg8VAeWv
         uMCEfld+rDkKJRnmMC6yjx6iuD213+jdbwsWg2FFwXgYzyZCN+/wFzmWFdkZXnW0d0WX
         jqmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489734; x=1775094534; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mK56nONHLvSZRp694UK1w71k4LRdzPAAGnPY2RMeLDI=;
        b=WmXsrEEZ+s6NUOJIMmtC6xxy0EcDtjoEMVG9i/9xsNnXzhW3npbLpEm7CKHn+rqD1Q
         gREtpo6x+VIsfQa+fEsbZ//WenqReU0Crjyif9qApLUadh5ZdscKY0AwuCZh8892hmg7
         GNVqT8OeNgXcTd9KQ0/stbDM92Wfv83TxQWdSfhuAE2JDQQLPJb8BPVgch1YBxRDUsZv
         u9CPvY9E0OiR6XXiGcolaZ0oRprA1G/1SMw0ysVzuLSveZZwEWucFRywvB4/OAMAOqnH
         8sFBsPGeh0AlMHxRkU8sUaJVNq9aVDmrrE4HLaCF+P95rg4acevE9qj0AD+a9dKvpfQr
         M4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489734; x=1775094534;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mK56nONHLvSZRp694UK1w71k4LRdzPAAGnPY2RMeLDI=;
        b=Z2+ynD764IMUF54lvTaj0n0/20/2Bq8NVvgAWZMGDOn+EEoNkEHTWN3fdZwIO8qp3l
         Nlum8xWTjvolCgN/IdGzND2pzJZiQiPmfZXvaRevY9vZb618Mz9SRahBOFvYJae4S081
         1VUPDZNs4DSWohlRcm7DBpQSqgGrSkdQgn2GRWWxxYoJ+bsAcWnXBUPpgAKciKGva1Yr
         bRTpmfKS3qQV0JlLRPGOQ7I+uD3KyZviEt6EovcBFbo5Mp1KK/vsF1ry1iLkIzcQpbA4
         JjKZ9nD/YwE2c3pfJT5GbLDXvp5KM770sVkcSRDnXNwG5nk712J2WWHF2gOLg5OyW55G
         nywg==
X-Forwarded-Encrypted: i=1; AJvYcCUedQsIcAJAWpf8WTmlg5pLHA8Ff0/L+CipTFDxKOQopqiO+pogpisss22VBduu0uBXv1xlimADUn3NxV4bJLh1@lists.infradead.org
X-Gm-Message-State: AOJu0YwkP13RUU0Bet3eotx8SNjvUZu9b/EugwzWXeuvoz0Dx99IH8Qi
	KWFlz9/nfaLjmomlpaafAMvjvyLYfyQuPbvX+B3s1GAyPW/OnBCiHf7fPjXPd7cQyd9dlZRTxPy
	P42SHBUvRvo7xvXOBm+GugeYnp+KEI7gv0g==
X-Gm-Gg: ATEYQzzzMU7lbWrQI78t4zRt3mefoCEwkXSd74nXwXb6QgYmlQcEuDhXDB53g2ibrbk
	3XCbi902/yyomhgN8lCeIKpN7h6++/NDubLC47GJ99NxqYAZvYRUjH6+MG57I5Bqym7FwyazxgN
	WRTXetPoJnH6eFa72REx2aS+ta8u+A5zh2lUiFXqvmBLpo3R+QKzf0PBJQN3z8pyBhm6kfi/bZ2
	aY7ChMxMdhh6PWPJKcC+o4xi60Hv8oIuUCJlZDDBLrTU6y8+IB9IJ0dpZ+gNGWg3l23I5sCIWUb
	ew4iQetkiG78HpCvaB8NVEzFnyQroIHPTv7DXISiC++1zps2jTmpDzNrpjY5bdfX2Zc5SdmQ
X-Received: by 2002:a05:6512:12d5:b0:5a2:7b95:af0 with SMTP id
 2adb3069b0e04-5a29b99beb3mr2142757e87.25.1774489733581; Wed, 25 Mar 2026
 18:48:53 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Mar 2026 22:48:42 -0300
X-Gm-Features: AQROBzCEGtcQEKRRRyGv33NK7EBXGMENHNKZf1n7NAgaCCXXjbqzsKJU3WvEsOQ
Message-ID: <CAOMZO5CSzvBdgN5b5E0v0DB1FT4481pRTwoQJ9YzC8yMt81kmA@mail.gmail.com>
Subject: Testing remoteproc on imx8mp-evk
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_184856_549850_AB49B600 
X-CRM114-Status: UNSURE (   8.03  )
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

Hi Peng,

I'm trying to use remoteproc on an imx8mp-evk board running mainline
U-Boot and the mainline kernel.

Could you please share a simple Cortex-M7 .elf file I can use for
testing? Even a simple Hello World will suffice.

It would be helpful if we add an imx8mp-evk devicetree overlay that
includes the described remoteproc nodes.

Could you please share the remoteproc devicetree?

Thanks,

Fabio Estevam

