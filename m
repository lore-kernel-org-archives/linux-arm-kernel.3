Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD8BC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZZUE7lDwTEz2N4r/fX75wAzeLWxw2u+R07S3BlIwfA=; b=iso4W2bn/i7srPwQMlKdnb1mdn
	xjRiN9/jtn/VsYLB/m33Z3fWDbfBv9qSWA6B9ZqQC6ElYYydACIlnogEitIeBIo1ostpp3tAEfAqu
	6f1mCKZRp44cZdbrU3X70qDTEGfdpiCIudvduld/XvOAXR09zZBXlT1lMwiiH5VIPg1qz9z7HQm8W
	LPv6tHX+fskVeeSvoAd3orcDJOBYC9+QniKM0slYy0BZp2FDUQZKDMbweD6GsPGnMLQvFMwhK/OJ+
	HlyAyGw4XDdWqIrrcMHQImi1LdTptiAsqv7csA+zCkKzwFhvTguDLyN/QM2uRgTLTvNkBTc0h+B5l
	gNdnNjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u65eE-00000001BU7-0xd1;
	Sat, 19 Apr 2025 10:42:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u65cG-00000001B99-3jU6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 10:40:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso2829447a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745059208; x=1745664008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZZUE7lDwTEz2N4r/fX75wAzeLWxw2u+R07S3BlIwfA=;
        b=lF8YbG0UYTkfwsEuEPe7nBvVnpNL8lknF1F1GKz1/IJQA9ar4bvC0wed492q2OBBlE
         tCmrkUo85hRef8KXQ5Cbv0e5rHb976Z2yLizuj5w2zM3X2fjZo9kohVay3/bznzFp3BH
         xXdifIaAFDcDiOH1wNMfI0Ztknc0BcELDwOCn981aqOV7TPEShYuwPsC4vPIGc8H6ddD
         5W+rOOZ//ysY43A+DZspLUZ3+xikJzBMuyAknGd0qyiLNmvERT+7MSOv1pDEr+k9xFgG
         zRg8u+bT77B/TGfNZAxZmPnN1hoovs883hiaLu8uXx429/AZY0O6HYMyPPAx4gmuJtHN
         qn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745059208; x=1745664008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZZUE7lDwTEz2N4r/fX75wAzeLWxw2u+R07S3BlIwfA=;
        b=s2gEoSvaD6jcaqZUSJk8Gzi5tRoqmZ6UsG1BeEHE/RCsWM7KLdKyNglWdi7tl4hP6e
         V3Go0H/R9SvvQj6Wb+ZPgGVumzV6NysFNd8HILhrbqx21U+L7zbaRENFjlsfQS6Zr45p
         wJcPuxWSYecCEXZctrh5Zdn85kzzJEyJHX/v4xcAGsNsBtZcJTUZcKaq9btIvkcMtUXA
         577yPGVXz4GJY2yOD1ot7Vf3qXGDCuIe4enUTreijB2MocgvTEB0EE0mJRCNCqdQ7lZh
         nbUiBAclXrEY2KmdFbqPen2xuQYzkd4iTFrNj3bk0AbY6O0PMuBHisM4X0CGbaLmjseQ
         jeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCsLjtaEceU2Efiy/ht2gaGarYUoPnQisX/gHSQ69z8zJ8No2M09GmWH5lWnDQIkbZU+u31XCjVrwqKWz/OsQp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx21oI3hHqr85OEDJXuRWtndvibfQSN1X3qAPtVfp0/T4puB/T4
	E5QQX5GOsKbhr6H6VvBEFTRtF885rpQ+x5iMBVc+jOklh4VYEE7sQBm8GumbXA==
X-Gm-Gg: ASbGncu1dOXv3Ev+XEhxIZlA6ueMI1FV2vzRJufLvMIciFH9jYsNF34qkYBiczvNKeB
	So/f0qUqD5o1qhNzBDutn+0NMAZC5ltWG0yEjTTAHVX0LP9sCt7JS7wLth1DCayMMVeT5HYHdnz
	lWICYXGmyo52W3pNAdRpOb+5v7sbaVbjWwO+rePyNRRGC9YGr71F8kVW6pM+tQ5dYURiRwvNAzb
	/CfUOhujbTx3ZBzORmNkEb/cFtcEgn4oIeSaZo7yAsU9Oi5M416Lr8zIoC8VXgCFFQPFjAXbRo3
	FpkQx0ezb4LmP+XxisHaZgoBcdyBROLeveyJLSpjCsHb27u5IlOIF7Id+RfZ8J8i
X-Google-Smtp-Source: AGHT+IG48rfT7dO1+AZbhGTz/iIYddl71I2wayyAJZkp73FfKaGBUzoje28Z41u2PE9+dTi/GMGgcg==
X-Received: by 2002:a17:90b:57e6:b0:2ff:5016:7fd2 with SMTP id 98e67ed59e1d1-3087bbbfcb1mr8635818a91.24.1745059207952;
        Sat, 19 Apr 2025 03:40:07 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed23e3sm30785155ad.194.2025.04.19.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 03:40:07 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: Correct indentation and style in DTS example
Date: Sat, 19 Apr 2025 16:09:44 +0530
Message-ID: <174505916020.32700.15920085651288867306.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_034008_936286_57DFD0F5 
X-CRM114-Status: GOOD (  10.35  )
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


On Mon, 24 Mar 2025 13:52:01 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: PCI: Correct indentation and style in DTS example
      commit: 37b52f92334c522d41c44ee4446e2a74cd830419
[2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include placement in DTS example
      commit: b3274b553aac4daddad998f426995b2388c8abb3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

