Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21167C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB2zG2k1G4WQxpgsH4LuYksFLvv8C8C4QIYaKBnq/b4=; b=xDdveA6sFKg7v95Rq49uuwDcSC
	rpBmSk5z2qar5twwRZKZIfxTr7wpwXNd3YUvncAFhvpJCHf0ioG5sFc+oplTCLB/sdaeiShvADkUu
	kGKPhWONe+CL8WeCMb7mwRjC9wpOO500beG7XIB1og0BC+zuSHcddFkhNoDChXr9xCgmvCsT4oNmG
	AD248/U2rYTKhnOLsW1mcCyh2yE0TEnbrMIyXrWYmqg48VrHl+YVEiKu0PUlz2UxTRfo65z1rBmS1
	xpKsL7ySvHJJ+z/DXHtmg/X2jVXbIPNOgbdLj5p6uZMc1bqOwujB4oXMOLQkPv88pMswUfULdJqFR
	caRnQIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOc3V-00000004BKe-2hRZ;
	Mon, 09 Jun 2025 12:56:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOc1G-00000004B2V-2avP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 12:54:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a375e72473so2080583f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749473669; x=1750078469; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xB2zG2k1G4WQxpgsH4LuYksFLvv8C8C4QIYaKBnq/b4=;
        b=b/FwLbth8ep6r5HlHy7qv9xDslPQf8RcZR5LswlIHESokYyXt8Hia9GrIJJBD3Pm0K
         2/BHgpJiRKkN5Qys5ZkhIPXvqsDB1yQc8C+HvE7gBRRpo/Rnz0UmTSWG6G5Bjdspf5Oe
         0MY26Q7OhsHXZ48rwhoowJ5PKLXp3UBNkEt3yO4MB6HAF+dC9Szxy+KDly4+2XTzED4u
         OC4+0ELiCE2tWTTNntzKGVBrXuoGAYl0mq1lB4CDu2eUQjJgdqzN+pvVSXgCnRZwZLDn
         B6PmW+s0Y1C9WtsNQoS5tmxoLzB+96j0o7ZMU8CW8j/K3YrhZSOmDPi2oL+EzIX7Ll0C
         PEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749473669; x=1750078469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xB2zG2k1G4WQxpgsH4LuYksFLvv8C8C4QIYaKBnq/b4=;
        b=L2MrWCbmjZHqQvfdpXCIy7W5jkaNaBglhgQQpqLiX/+05xs4QMgas4grkcJXGH6uM6
         kKK/aNr5SWcghW0L++Ae25x/IkHGX+oG4HbTOqhQxqZg1sc5c+RjOtOZzAFKxsiKRk0V
         HHvXM15P5tvcWEHTcz3l4jTWOphcSzt/V1k/vU1xNNcLT232TYz5pgP1JWnRWwyYE4jm
         RX/e6wWSFtLO5TJqueIEyjzkggo8nmN1E3kaK0tcL8Zba2EkRbjLTo5N951sn2qP01aa
         PGhZyFP+OP8/t1dmnWwDlnbR1sghnRD0d3jx+97Rd78Y44HkI8hQdqt/dSs+6iVI6g9D
         U4zw==
X-Forwarded-Encrypted: i=1; AJvYcCXDFaTiou3YP5HO2gzoQhQe4d3vvKs4H1BBGkElSi++yeNRRf/HZ2mAAIeaPD3cd0XFmKfj/2jnE8W+5oBIaXvz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3HLTY4ccXUHYiAo4NF1pw2CVBPMuE1/oDj8Dc8LodgDayjMqX
	x+tnE1j7qP4TxiBE0zsgXzDY76bCLaOLBb5r3NavNMxKxfGIRWm5GUcWDGZAPLzquiY=
X-Gm-Gg: ASbGncumuCKmAppPE7/fAk0/r6oJXG8E3oM4SN9xX3TaYLwzc1+SARnzGAt2MORDMz5
	yXHCbuE3TrPHENqArAQl9T4hIq7AXoAS1Txj341DIGQ/enl+diWeYIRDkivkNQiOViw7hPan6jP
	JoTRq9FCtyLzufcDoxAvC42rMIiIJycEd9opNMVEKQFFQgfbhXKRIRekK1w8kzG7eP9JdpNwVS1
	Jsy3JJbNFtfGgSZdXRCKex1ZwxFkw7aktXO1ripey1Tr1xX5Koa8dCKFAj6OEDqhXss0F5yFWXP
	0DYB6yJsqxaL4xrnBL74qbQDcN/s1QumT+Ivh5vloDFydsZ3uQ==
X-Google-Smtp-Source: AGHT+IEC/1dBxgIFgGAmnWpdiKwEZouvKkkuBZf9Ps4mzSz9CyCY930v5yHNcYS1Azk34Z4raHel5g==
X-Received: by 2002:a5d:5f94:0:b0:3a4:eecf:b8cb with SMTP id ffacd0b85a97d-3a5318a7648mr10575693f8f.28.1749473668526;
        Mon, 09 Jun 2025 05:54:28 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::2f2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4530748870bsm62109445e9.33.2025.06.09.05.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:54:28 -0700 (PDT)
Date: Mon, 9 Jun 2025 14:54:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, seanjc@google.com, 
	pbonzini@redhat.com, anup@brainfault.org, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
Subject: Re: [PATCH v2 15/15] KVM: selftests: Add riscv auto generated test
 files for KVM Selftests Runner
Message-ID: <20250609-cb3c80fbe1fe702668830b1b@orel>
References: <20250606235619.1841595-1-vipinsh@google.com>
 <20250606235619.1841595-16-vipinsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606235619.1841595-16-vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_055430_656205_8F992F5F 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, Jun 06, 2025 at 04:56:19PM -0700, Vipin Sharma wrote:
> Add auto generated test files for s390 platforms.
                                    ^ riscv

Thanks,
drew

> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test | 1 +
>  .../testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test  | 1 +
>  2 files changed, 2 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
>  create mode 100644 tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
> 
> diff --git a/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test b/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
> new file mode 100644
> index 000000000000..d34b4b9b77ae
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
> @@ -0,0 +1 @@
> +riscv/ebreak_test
> diff --git a/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test b/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
> new file mode 100644
> index 000000000000..5abb62c51097
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
> @@ -0,0 +1 @@
> +riscv/sbi_pmu_test
> -- 
> 2.50.0.rc0.604.gd4ff7b7c86-goog
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

