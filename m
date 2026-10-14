Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20629CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=La3IGCJzcQNQ9anmlymqvEqtbx1gbMCxPmpjE3ilM98=; b=4BCTsAFVDdqyPd3ucEnYf6hF8g
	41/2X/P0lLQMvN42vpVeVDdWHSvcbIKRf8ux9JDexmiqIZKE6JQUzZ293BYt5PH7FT1yJxW1SMyFD
	5xUgsj3be0f2WDT2sdJyFEu/9iWo9icD2NRoE2Ul6NCz/9nozZiQPP1Ad3NifYLs+C1KEdhBRFWyf
	/RptRCIifym54n6X0T0k+eQ+7ghq5H5ytjQCzJPUUxY/7+nUEae6soT8tDOm1Jsy00jHZEucAhlTy
	bS1inA4Rs9zsjgnBz9DYLDfPbbEsEk1OACuNqASldyRIoNjBxMV0OcEtjOd97iFoWJP/UmhIbPyxa
	gf6I5csA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt61-0000000Egh3-0MNK;
	Wed, 14 Oct 2026 07:08:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt5y-0000000EggM-3sV7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:08:16 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48afe75f055so73946f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791961693; x=1792566493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=La3IGCJzcQNQ9anmlymqvEqtbx1gbMCxPmpjE3ilM98=;
        b=YUDbPsKf6JM3W/l3UjE5ZHJUDyoj6oESjla+jIXCeRhraSVOAXzJ2n7TD4jOFPrDSl
         ZfrVYhDKugP198MdJAo3LZlBIuFaHREFbfRITIXohk2uwLvWvQkTeDoQxnK3Kt3a501V
         cqSudkp9ANQ4kZGzpjvEF9EllXjdXDA8gpY0jXhQM7DOf2vABBjzjd0VUIPCo4IWqXIg
         hyguDZjvCsqIWjvy2Q2ZgIrwX/lxaOng/UJ0/VR0S/QsMuYVEzRpV3dHU2u2JcVMOtxr
         9yKiftYZzVNmXEqNocngt+hmTs5aJyMWxS777KVNa8olLpf8QuO7eP+ToYc8Rpw3jhnC
         Kwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961693; x=1792566493;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La3IGCJzcQNQ9anmlymqvEqtbx1gbMCxPmpjE3ilM98=;
        b=vpvKtLeiMe+S+I+DQOsIhuBS0eU1xrVzsS+As0NrsEh6gnncWs0J150Wlcl1V8cLM8
         QND6Yv7eq7GgnR0u57gTOOcVNEVJSqF5WZx1UFDtNEwX1VgtFplYTDmB9kVKYw48Q3Oi
         3XIPiq6etvwISf0VKgpkY79zKyVohwiwg2UE10U34VRkSby9sPXITcPY1Pla0FNisqUP
         4GWehSXGKbw+5WRt448uuuAdpyV9i+u0Ux9hggL8Cbcjwm5tPrK2kSQZg9DQberEc686
         KKGR6oC6FbG+YUyqtaNnOl21siZ1lJ5B6SFFgI9nRapM8MoeDmUOSIcJAbyVbl/Xk/vW
         tl0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3TJ+CXBoCzAzpzDhU+w4auWxUzoooPozRzAu3F4cWIjoZM3FbAYlXKy3tkGCzOB5X4IEnXyNjz+nAwqrQXM2b@lists.infradead.org
X-Gm-Message-State: AFq9FYIu213ZliLzKISpREDsLVJEZWpJjO5SupKoygFhnavYn5/fOuet
	/hAZXNdOCi4WF1c5rJAsMniLJ8EHrOl2MdHbhtAxIe+Nr119ojePWzUn
X-Gm-Gg: AYBFou1OlVLERwq15JLrkNrQOn61um1vCxXHDD+64dIX4drTL36RUH8rrtzdg0yDEOb
	ItOC8pQhJnUOyEOGNmk65ydHgHAYcQf0NryCZ5psovWWu1+OTWx5QeCrRRsvzTRoodB91h/hx+I
	ank2pO9qRtmHoPkrGxu4TnToHVnGLwQl5mLunx6CyIVxOHx34qFJ1613EllAkENdwj92WdC6Dnh
	Y3BNBgpthr4Pb906ZKl96xGM7UVUfil0CaBSTSfS5i9NZINFT4lpxcB6gcjynhM2mZ40VI0Q3bz
	YW3WeiQo1urk9b4VQSZIOcU54ENIvc/XuAjeKSu6me29rouJb8M9cb22pG/xRxLFhi2OhtixGVT
	/tRaLttEXItHxiSQvBwXqdXNb8rPxxatu5qCZqS51D7GNUqF/tdFRmYflEQ/hfEDX0prylsGMla
	RaKrnAmYje4CIuE4gJEIeWwmaRx31gyu+O4gZN3gvqBqFjfrmQgbPPA6ASAomWBJn2/md/xaZPx
	5iPFiMuLyrh83Lxz1vQ01e5EID8YSCGBHkPwQPvfTLalHwth6RjNXLo+BVxE6fJRn7VikgotZrP
	VtI0lq8FHPlkHU3W1GSaKSQCex2RbM08xgqv2+urqr/v/R+z3ewlCfRpO7UCaQ==
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr279706725e9.8.1791961692688;
        Wed, 14 Oct 2026 00:08:12 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4819302sm27797175e9.3.2026.10.14.00.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:08:11 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Wed, 14 Oct 2026 08:08:09 +0100
Message-ID: <20261014070809.1718578-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2bebabca-9df1-4ccd-afdc-3a1740c05061@app.fastmail.com>
References: <20261010130024.177503-3-ghahramani.navid@gmail.com> <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com> <2bebabca-9df1-4ccd-afdc-3a1740c05061@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_000814_989726_45395720 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi Arnd,

Thank you very much for the thoughtful advice and guidance.

I completely agree with the strategy of decoupling the problem. I have
dropped patches 01, 02, and 03 from the upstream submission, keeping the
outer-cache serialization workaround downstream in OpenWrt so that my
local test units remain stable while I get the clean platform code
upstreamed.

The v2 series now focuses entirely on the clean platform support:
1. Unified ARM/ZTE ZX SOC SUPPORT entry with Stefan Dösinger and myself
   as co-maintainers.
2. Split CRM DT schemas (topcrm vs lspcrpm) with fixed clock lists and
   simple-mfd reboot child.
3. Logical enum IDs for resets in include/dt-bindings/reset/.
4. Isolation of PCIe SerDes/PLL into a Generic PHY driver (#phy-cells = <0>)
   under drivers/phy/zte/, removing all raw syscon poking from the DWC
   PCIe host driver.
5. Integration of Stefan's tuned spi-zx.c driver with CCF dynamic clock
   scaling.
6. Header hygiene in platform drivers, avoiding <linux/mod_devicetable.h>.

Once the platform series is in good shape, I will explore using
lib/logic_iomem.c to see if I can register a transparent trapped MMIO
region for PCI reads as a cleaner long-term architectural solution for
the silicon crossbar flaw.

I will send out the formal v2 platform series shortly.

Best regards,
Navid

