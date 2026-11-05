Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=znX6wpNl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MX4JOnf+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1XoxhZQuWCpWR6i2ysnsmoZiQuV1dhOeh3iEX2MAi1I=; b=znX6wpNlgrS4o0
	gYo7eBSK5eql93mmW3lQSuJm73jXHgM5jQ6KgjeXhfYhNJGSkdBgfuzn0Y838cItLcKMrXU7gdshs
	a6BaTGR64N+lATBkQyfA89e3cNAzyVHqUadQbY8O8MF/8NohO2wKbGMp7wq/bRp94gZciUVA2OdJc
	HoMmdjuMkInVe3XlNhO+aDGFfCPflkHk22NCFx8ZWd9P/U2rsAHXDmu+ZYee5mkv9iwXOhP6onJe5
	gMnwKEXxMUH9jvbQGb/UAxlUGB3VtIXcLu5BmYIlucG1POhxLiOgnCpibD08LUK/jjzftiYoyrSig
	MlJRmB6wYGDznDeQge9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzbZ-00000009QkT-1vkQ;
	Thu, 05 Nov 2026 15:42:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzbX-00000009Qjl-3nns;
	Thu, 05 Nov 2026 15:42:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2441B601DE;
	Thu,  5 Nov 2026 15:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC601F000C1;
	Thu,  5 Nov 2026 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893338;
	bh=1XoxhZQuWCpWR6i2ysnsmoZiQuV1dhOeh3iEX2MAi1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MX4JOnf+Hwpy/aRs6nuA4WRva6s4PkvH4OvbOFLujC4MtleCBbI+uW4QEP/D750+p
	 hK2cc3eNZSjTx/+8jXUvjNh1D+fuOOSbryjnYemuR/+l+79yBy15SUffVorif+vBmI
	 wnrruQyJva4GS2eMnlWo5lReuGjGGmVVJk/4C82mqkmw/+dg0TZYB6ZNmPGrYbLEi9
	 4CO3lHVaDaqgNgz+hao26qu+Qao8PaMzXCSpxDiASw1eLIm9gIaEt3KQOzWjZ7R6oq
	 hL+mO1Ni88TLGQErQPxpt0uP1QeZIOP1zuw3Pdao5AUSsFrOSPIDs3Bm6lXTgoW+sd
	 tw2ICX7E2Dojg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Diederik de Haas <diederik@cknow-tech.com>
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261021101533.609118-1-diederik@cknow-tech.com>
References: <20261021101533.609118-1-diederik@cknow-tech.com>
Subject: Re: [PATCH] PCI: dw-rockchip: Remove redundant dev_err()
Message-Id: <179389332686.20463.1542966785422218800.b4-ty@b4>
Date: Thu, 05 Nov 2026 21:12:06 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=315;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=yDeRkgBLXRtw1UNPYCqbWGAbbL0ZJAQvlVqWUU6oUNw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq7KPZMKvYH9neUuYEjJ6Ov4o45k/neydHQumCV
 gVgO8yyEgeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauyj2QAKCRBVnxHm/pHO
 9aN1B/452DI7Q5hk9krngeRYwL5+6KqtGh7eqd66KN7MAvp25vFwoXR/eDujdU4RvXYnaUjcvto
 0EVJYXUEVO+FgzWdft+YTXpCGvGiGEtwo7uY9XJ2zucTHi29KFwgtJ5k9vjDF2WmzOBxgAtrYH5
 22c/1uvuVQMl6rojgauP6WVCZTUU9S+KVbKanr6N93ncBS7RzAktJdOuuIabj6RabR96q3CG6ih
 JpeJ5FVzaaNS4gxYZYSMIXC1aB3HrzsRPoY9m6MswkuNcLRXoAugbLz1MBfPaJaCCawa6+RmLDR
 b4tyXfmLMrxkLTq3QqeUQJnkWXf6fsLA/gxk9EnLfL2tt12W
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 21 Oct 2026 12:14:57 +0200, Diederik de Haas wrote:
> PCI: dw-rockchip: Remove redundant dev_err()

Applied, thanks!

[1/1] PCI: dw-rockchip: Remove redundant dev_err()
      commit: 0da078b4bdc56bfd48bb52fa64809942f771bb12

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



