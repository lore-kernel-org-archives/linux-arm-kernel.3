Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16207CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9O8tHwn09nsjeClSuqgfyQVy6t2GJ6AHHgo9UAkBbk=; b=sd8+XTQewzouxK5ve6xlfYaMgm
	sDuxZHXsllBrFSCfVgwlRRp4XDEFQ11qP4CaTPV9zIyQhY/ZDkcogiMCz6IA4iBY8PCbWrvMms6fk
	3/tx7tRwPbAzgd1wVesjYtoK7fee+R1Hr/GllQvTz9tjPV8FlmLKwwLwcKFMJkpJ2ow3DMfg+/5fn
	Nt2fHsEN1Y9ZK49ONNU6IFFZAjzsJFccykptWkf/70DrHFaroPSpWpeaYSkQgkb/C8H3TVtVGfWMB
	Q1qbcIUrmxLS7l6nc5c6pSnwK45XjEF1i2u9Z0Fujw2xJPj4sLQc4Pkg+RlNl/K4z5KC4MdvxTEy+
	WkR/b/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yL-00000008raG-3wJm;
	Tue, 09 Sep 2025 17:17:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxlf-00000007B0d-0Gtn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:48:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45de60d39b7so15007845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757422093; x=1758026893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/9O8tHwn09nsjeClSuqgfyQVy6t2GJ6AHHgo9UAkBbk=;
        b=LLQ91D1fp8SOyPp6/WhJzgV+Ht0q0TlorKvPp9Z1MiqZTX+2ZFuoyukjciBYJaS9m/
         qqtbR3P1FG9Q46DwgLc0wRDnIBJlTefQrIkkGVSWqu47tbzSMIB3p0CTVzDajk8SyPjk
         1xTQMiofhf8SXcoT/hc9xc1gHUs943mfrtaHZtTKhFtqYW49vaP+xCkMtMvl6DjF0pD+
         LTz9XRLiKtTPt1f5LFixZATW9CUAaAae9Zvd/rRbGEkEMrbjA5GNECYR9INV4bR/WymE
         vzLpX0l4JtvbSjKKiDJswQeg4WZggrIvDE+WPYGfrlVQAKrFSKLZJGgUaztv+kFXRiWb
         FcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422093; x=1758026893;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9O8tHwn09nsjeClSuqgfyQVy6t2GJ6AHHgo9UAkBbk=;
        b=Um36ofDDQUI/oPexFw70L6FEOaKDlrP+iI6hGAt0KHYlQSfIhjqAHBwGJkeegsrKcA
         ihHVb/BmG/0YegN0ycbS6fhgoSQ/Kpl1pRPvYB1wGY88QV5Mbzl+iqpozuELfQ24NPEB
         o+UUhPztlCj4kpiY/ODiZOWF7lnF8TC4xeitcLXSyRUAICODjeD0mHpzknrrIavzsxz6
         AxqEWhSPplCxUHj0PZnKUq2NtRs5ZrKLoy499Q9iM0P1XrNLt7KyrP0+lQcqhVSpbH6k
         U6S1FVm4TU5vKY2M7Jb9EX2xPfahwYx/xuZF4p20OmdND/NGZ4EtvzbONYQk8qpBGVgU
         VwrA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8yRFt4MhTgl3dW9wvWjwlmL+pBwmIWavnM1LrwQkLMj5bBJc4J4T4ogvXS2HSB1+5FcjjxML1JCQM8HP0f8X@lists.infradead.org
X-Gm-Message-State: AOJu0YwRnEfJrakld6ncTE1Pp2YGnT4TXegwbibGmKkfch+wjT/liyLz
	PstZ9gurVKCBobXzAgwj2BT65i1LWDiWzhnjAKOkka1qWshfMA40NfHjZ1UhYa+c5lM=
X-Gm-Gg: ASbGncuo/B7VX5/VW2oJoY6y805h/ZYPP+gQPLp8MSVSer350d8rtV5WvfxmlU7fE4F
	28PxZfeHv6eo2dpSgRETp7OTMPluJj+9xTFi38BQhDieSx2P0fQEpuCQtI/45LWrx7gx27V3zTW
	PkgcPcWiQDD4RLOd4vXt5uAHVIFjF4FoEwmJOLnyal/EFwUTjCAZ6ERnfskocztk9Z+x/IiF9Ud
	vZFUIxvjY5z9HGW+9HfDppKeF/blhL9kA72AHvI3m6oPJjzHR0gQ98kR81UYMfDSzQRQDqx5nbv
	Oq0QV7Bcgn3JH/KBV+kR8PdEfx+whRotMYY10sVDZT5IRVT35MpC6v2Dtp1ydZzygJik1pNEQvE
	U3X50NZDeo8/i4dIXzgePQNP87a0ptm2fufBy40ArSg==
X-Google-Smtp-Source: AGHT+IGNhrTxIPsosCdGJWZIZAbT0RGPUxRM8nlUnIFpaFAXk/yICLpZY71X3iYYFxkLTIc/wDUO1A==
X-Received: by 2002:a05:600c:46d0:b0:45d:d96e:6176 with SMTP id 5b1f17b1804b1-45ddded62d8mr99306545e9.25.1757422092531;
        Tue, 09 Sep 2025 05:48:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2503507f8f.60.2025.09.09.05.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:48:12 -0700 (PDT)
Message-ID: <ba50f82f-3344-42dd-b58d-0a1d7438e1ac@tuxon.dev>
Date: Tue, 9 Sep 2025 15:48:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
Content-Language: en-US
In-Reply-To: <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_054815_286213_7B8391DB 
X-CRM114-Status: GOOD (  17.91  )
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

Hi, Manivannan,

On 8/30/25 14:22, Claudiu Beznea wrote:
> 
> On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
>> On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>> only as a root complex, with a single-lane (x1) configuration. The
>>> controller includes Type 1 configuration registers, as well as IP
>>> specific registers (called AXI registers) required for various adjustments.
>>>
>>> Hardware manual can be downloaded from the address in the "Link" section.
>>> The following steps should be followed to access the manual:
>>> 1/ Click the "User Manual" button
>>> 2/ Click "Confirm"; this will start downloading an archive
>>> 3/ Open the downloaded archive
>>> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
>>> 5/ Open the file r01uh1014ej*-rzg3s.pdf
>>>
>>> Link: https://www.renesas.com/en/products/rz-g3s?
>>> queryID=695cc067c2d89e3f271d43656ede4d12
>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> ---
>>>
>> [...]
>>
>>> +static bool rzg3s_pcie_child_issue_request(struct rzg3s_pcie_host *host)
>>> +{
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_REQISS,
>>> +			       RZG3S_PCI_REQISS_REQ_ISSUE,
>>> +			       RZG3S_PCI_REQISS_REQ_ISSUE);
>>> +	ret = readl_poll_timeout_atomic(host->axi + RZG3S_PCI_REQISS, val,
>>> +					!(val & RZG3S_PCI_REQISS_REQ_ISSUE),
>>> +					5, RZG3S_REQ_ISSUE_TIMEOUT_US);
>>> +
>>> +	return !!ret || (val & RZG3S_PCI_REQISS_MOR_STATUS);
>> You don't need to do !!ret as the C11 standard guarantees that any scalar type
>> stored as bool will have the value of 0 or 1.
> OK, will drop it anyway as suggested in another thread.
> 
>>> +}
>>> +
>> [...]
>>
>>> +static void __iomem *rzg3s_pcie_root_map_bus(struct pci_bus *bus,
>>> +					     unsigned int devfn,
>>> +					     int where)
>>> +{
>>> +	struct rzg3s_pcie_host *host = bus->sysdata;
>>> +
>>> +	if (devfn)
>>> +		return NULL;
>> Is it really possible to have devfn as non-zero for a root bus?
> I will drop it.

Actually, when calling:

pci_host_probe() ->
  pci_scan_root_bus_bridge() ->
    pci_scan_child_bus() ->
      pci_scan_child_bus_extend() ->
        // ...
        for (devnr = 0; devnr < PCI_MAX_NR_DEVS; devnr++)
            pci_scan_slot(bus, PCI_DEVFN(devnr, 0));

The pci_scan_slot() calls only_one_child() at the beginning but that don't
return 1 on the root bus as it is called just after pci_host_probe() and
the bus->self is not set (as of my investigation it is set later in
pci_scan_child_bus_extend()) leading to rzg3s_pcie_root_map_bus() being
called with devfn != 0.

Similar drivers having ops and child_ops assigned use the same approach.
E.g. dw_pcie_own_conf_map_bus():

void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int
devfn, int where)
{
	struct dw_pcie_rp *pp = bus->sysdata;
	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);

	if (PCI_SLOT(devfn) > 0)
		return NULL;

	return pci->dbi_base + where;
}

Thank you,
Claudiu

