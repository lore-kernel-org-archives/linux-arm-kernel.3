Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5705CC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WylwH9udkWEirydfFpUxcOPjDX2jBvnP9PP0c6bnys4=; b=0kNiRoFyZunummRd2vKYJZ/PxZ
	1Nvg0jg0RiRFuvZ/+vpXnVHxXhm3Ab+oa6QKsnmWzCXW3eqa7QN9k+rMnbMI6XNIOZvcHq1oyJjfe
	1O7hALWTR2nl22kCSvWnLZ2Y1QaGyhgdfwaCdufyzR4Mf3t6YbW2Rcx2OtnNYJxx2oP4GHqtrmRbj
	YOvhtOqD/BMEjpnhXlLDY96ApjhUhP+lrgu/wnJ4cmmtfJxvOtG3b+VWJ5i8ODsJSwRl4N2mSLt0M
	Mtu/ritEpSLJVHC2aEHYVZM4LLOjZlhV6Rv+by6k3Qal8gkQGXWyJgqs0aGBFiTO7eUoLSbkv7xwb
	Eqj7nSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9R0-00000008gIS-1uKq;
	Wed, 16 Jul 2025 21:13:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8Ak-00000008YCj-31tu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:52:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae3b336e936so38747766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1752695529; x=1753300329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WylwH9udkWEirydfFpUxcOPjDX2jBvnP9PP0c6bnys4=;
        b=TQeLIvlC+PnJVjKnCCZx6GN2uxjFhblAkJ+ftmlpGHG2iAKbm/tmFL9TjPNlfVrTSe
         sRT6t/cyHzmwMZE1g3KEJch5/vl1+ZnUrbJxS+pRQSOnTxzZ7PYhjoDs8YqC8L7pK+Ld
         FKupfSaK7boCjC4d6XToOv5/EKOdCY1Zr80DF3flWl/iBJb13ZKABJ7UHb1CCKRnHPjE
         km03hA+U7F9cjnNDcgLEZlnt1xlKFVSI6/uZltBV+ro14ugw8rwrHjRUYnyJOMDBeYOe
         4kCSmZxISD11Q7oik50c3yinMOQpL0X3qMXJdlVWuSVUR2oR6/corL5+01Lc2LBAwB+o
         Li6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752695529; x=1753300329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WylwH9udkWEirydfFpUxcOPjDX2jBvnP9PP0c6bnys4=;
        b=PqbTfXf4XICj9zzp9WQUDKxmgP63eXomt9sw2Q59Vf1UJyqDIdNzZDUH60GxQDEvDr
         SHy5XWFuV7djcx59BP7AzTuHX42c8TVc+bN1F+vlap9X/x5cgSw4cfGKs1V2zt32v9u7
         erM8/CJ5pwrXqVjKIVCy4WzOMv7MAKrdK9RzbUra/VbFy8inx4eC41f5VyzvCt0SN8GG
         ECLfUnzGOdHectE74jxXN7Nds7K+IkHgi2TkmeVWq2aeP7b50KQnk9eS+DfiI5sNk2n1
         FbQTaFMNL9vmsv9oxfMRQi4NTh+J/cKJz1dNokrGaaPQxpB93NkwlEIE9wFDBxmwYUHx
         xdMA==
X-Forwarded-Encrypted: i=1; AJvYcCU6bgQXeLN4U4k00esywJKgA3tjuH6VkYRJQK4orNYL89oL3j1PVpxK3YxqQ19+b6LP0FKrzOZkZfgyYw13ILwK@lists.infradead.org
X-Gm-Message-State: AOJu0YxOFBqVdC8J1STufehYLbDlivkV+l9CRJF1fm40hQJUEmhVpqQf
	++6zaatgMt/IXb51APk6FcDSCvXUPctPPv72WZ5+okyQE9pjzA6kId77qfhf5iXhwKM=
X-Gm-Gg: ASbGncv40jyLKwiH5YREFDSymM9acMMFY9tcEFWY2XrP+pGp37c3CHzwaG6bo6Ytl8w
	nGOjCAqah6xHAjM74LjKtf/N6K5FKdQG/uGQXYtc76zZ1RFEkA0yvYiJYm6PI0TtJNiiWkss/iA
	Ev6izm3mknOolfQygtDAYhL4rE8fMXU/xl1xpm8kekx6TCSmyybwV2OndTBU5IhmuhQWff3oUDr
	H9dzfetPT4eYolGWfLFUneW013jTsM7J+sTnh+cUts3n0ci37hqrFYFbausOHMqZ5dMIZhBH+x2
	+QpT8ltP2jIbw9VdSJ1DAGunwlOG4VUJSgW6pxeK3z507w0Q6yHtNorxBC9NISYp3HSpvWXkyxz
	uliUE7OZQH59srSP3m8qwfJWhvggLztA/K5WlYgAshluvB5wRxydo7ApaXkaG91RaVfr9jXtgPQ
	==
X-Google-Smtp-Source: AGHT+IGygX1TQGdl5nkgUTMKIPJDS7d+3SCAT5BWxK31nx9sZBIZYAxyDokvqQUYUkXglqscKniUyQ==
X-Received: by 2002:a17:907:983:b0:ae0:54b9:dc17 with SMTP id a640c23a62f3a-ae9cdd8605amr388186566b.11.1752695528420;
        Wed, 16 Jul 2025 12:52:08 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:a864:eb02:add4:d64a? ([2001:67c:2fbc:1:a864:eb02:add4:d64a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e9105csm1233073666b.20.2025.07.16.12.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 12:52:07 -0700 (PDT)
Message-ID: <7d8cfcf5-08db-4712-a98f-2cbfb9beeb85@mandelbit.com>
Date: Wed, 16 Jul 2025 21:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] PCI: vmd: Switch to msi_create_parent_irq_domain()
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@amd.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1750858083.git.namcao@linutronix.de>
 <de3f1d737831b251e9cd2cbf9e4c732a5bbba13a.1750858083.git.namcao@linutronix.de>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Autocrypt: addr=antonio@mandelbit.com; keydata=
 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
Organization: Mandelbit SRL
In-Reply-To: <de3f1d737831b251e9cd2cbf9e4c732a5bbba13a.1750858083.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_125210_926636_302BBBF3 
X-CRM114-Status: GOOD (  12.72  )
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

Hi Nam,

On 26/06/2025 16:48, Nam Cao wrote:
[...]
> -static void vmd_msi_free(struct irq_domain *domain,
> -			struct msi_domain_info *info, unsigned int virq)
> +static void vmd_msi_free(struct irq_domain *domain, unsigned int virq, unsigned int nr_irqs)
>   {
>   	struct vmd_irq *vmdirq = irq_get_chip_data(virq);
>   
> -	synchronize_srcu(&vmdirq->irq->srcu);
> +	for (int i = 0; i < nr_irqs; ++i) {
> +		synchronize_srcu(&vmdirq->irq->srcu);
>   
> -	/* XXX: Potential optimization to rebalance */
> -	scoped_guard(raw_spinlock_irq, &list_lock)
> -		vmdirq->irq->count--;
> +		/* XXX: Potential optimization to rebalance */
> +		scoped_guard(raw_spinlock_irq, &list_lock)
> +			vmdirq->irq->count--;
>   
> -	kfree(vmdirq);
> +		kfree(vmdirq);
> +	}

By introducing a for loop in this function, you are re-using vmdirq 
after free'ing it.

I can't send a patch because I am not faimliar with this API and I don't 
know how to fix it.

However, the issue was reported today by Coverity.

Any idea? :-)

Regards,

-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com


