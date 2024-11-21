Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1280D75BCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 07:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92gCfLlbkoSQ+MHQdw6XXaTfuBEXHZVZp1ICXYhuYKw=; b=TBU9HdywuwxP4kNTp7ZLzvlMTZ
	M3eqciOUEkelMpp0dEckL3uN+ZZumiqDtgnDVKIw3KQRFiprb99upG+Ls8ylGBrslxBmhPFe2HF4m
	FGyvXksJ5AFlQgWNrejXkGh0w9ggFvmN7h7iW/pjybeL5Ytng6nKuprjYNlX/qcwMVBR4mDRZFV0h
	GW8Hzntd5WljXUYIDdbWbJCH1RUbzb0zKQ/8/NvubWvrN8n/gTBs3EBDXblsL2RbBNezyYH21KnQT
	9C2cRc4SDP0MKRSyXu7/USLPvlEsjYWheV3OKMPArhEzXvFhEl1VWKLrg22m9Vcx2b9NZGQGm0Ad0
	cJL2XHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE24U-0000000H35y-1bOh;
	Thu, 21 Nov 2024 07:57:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE23Y-0000000H31G-0qiL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 07:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732175811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=92gCfLlbkoSQ+MHQdw6XXaTfuBEXHZVZp1ICXYhuYKw=;
	b=NGzvxwscGKD/32hubB2+OSX9/bfao0uGkNMKe6NnbbPQj1VA9r3PxyPOxrSAsNqcGdEJ/Z
	5D5lKFeV9Imfu74rXoEGvc0YZW8fQahn7v8fnjuiFZhzHX5tHP2/An2hJhqMZENXub4VPR
	rzYTY+K9i0DBA/Xy2L+/eg5OdzQaGYo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-828f819pNU2T5mQ9uwiRvg-1; Thu, 21 Nov 2024 02:56:44 -0500
X-MC-Unique: 828f819pNU2T5mQ9uwiRvg-1
X-Mimecast-MFC-AGG-ID: 828f819pNU2T5mQ9uwiRvg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4314a22ed8bso3951335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 23:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732175802; x=1732780602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92gCfLlbkoSQ+MHQdw6XXaTfuBEXHZVZp1ICXYhuYKw=;
        b=fwNaQ+4Ec58OnG2Je/0Vc2ZJ14qhGWegkCAiJgavkpk3ujTI31kLY47+jEFZHm7/6J
         yZtSiPQ3UnjumnvRDbRqRK6IWubqPG04b+iGMUTqbXIp0ieCQY8VNhLTZW46/y/bQohl
         PNqew1Tk087xbYsys+7oG1cirsAtNvby6FLSegy6CKLHDUFLopmgmNCg7k3OhfSmYffQ
         dcwC7mpl2c82SaEzx4BPuNJsTeU4TYlJXptKLTTS1kSYmpzhwtC1yLBjAzlR03IU7ocu
         S2V9l35/Su9qQRKTkG9HVgjkkjtNY3C+u3HtidpzN0XbbjnamJv5EZDHDicGfVdT9EzV
         HDLA==
X-Forwarded-Encrypted: i=1; AJvYcCXhlWVPhahzfFK5O7GnFtJcZrooj9NQNk8d3QdjHCbs7W4DJ/tCKGAJN3eTUmPfMiB7APn6jfCGG/R3HlLXOBVs@lists.infradead.org
X-Gm-Message-State: AOJu0YwWZusaUOS0KkSVpkSB+7SldsASXwlkULrkROkbn8oTJ+qwgoN4
	sUhy7dA2SSrWC97lOAoyVGhZu6iHA53a9Mafwji3rrnNEPNaCMGbOCGoxMZbC9LGQZnoLmVIGAK
	5YitEA0sVhPbFiIOmSTFHbKlHz4bA3Cs0VpBqOMWXuNmlCiptrgIdE5WzMlSk+E0ez7eUWr96
X-Received: by 2002:a05:600c:1f89:b0:431:60ac:9b0c with SMTP id 5b1f17b1804b1-4334f022976mr44764505e9.20.1732175802518;
        Wed, 20 Nov 2024 23:56:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9Dv/HXrS6bFeraR7f6sCHP1IXYQOcRMLqrn6BC9ptxW9TsIBcM2hZN2n9VyoonPSe3ABPUw==
X-Received: by 2002:a05:600c:1f89:b0:431:60ac:9b0c with SMTP id 5b1f17b1804b1-4334f022976mr44764195e9.20.1732175802157;
        Wed, 20 Nov 2024 23:56:42 -0800 (PST)
Received: from [192.168.88.24] (146-241-6-75.dyn.eolo.it. [146.241.6.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549107f9sm4076856f8f.51.2024.11.20.23.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 23:56:41 -0800 (PST)
Message-ID: <75abc41f-a406-4562-9282-bcac0010545c@redhat.com>
Date: Thu, 21 Nov 2024 08:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] net: microchip: vcap: Add typegroup table
 terminators in kunit tests
To: Guenter Roeck <linux@roeck-us.net>,
 Daniel Machon <daniel.machon@microchip.com>
Cc: Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241119213202.2884639-1-linux@roeck-us.net>
 <20241120105202.cvmhyfzvaz6bdkfd@DEN-DL-M70577>
 <24a5975e-a022-4bf4-a2ec-76012f977806@roeck-us.net>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <24a5975e-a022-4bf4-a2ec-76012f977806@roeck-us.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HF521vQaKyNL78jrgAXQ7wCW4C9rAgm7uxjvn3pA4OQ_1732175803
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_235652_310882_E1C59D51 
X-CRM114-Status: GOOD (  13.39  )
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

On 11/20/24 15:58, Guenter Roeck wrote:
> On Wed, Nov 20, 2024 at 10:52:02AM +0000, Daniel Machon wrote:
>> Hi Guenter,
>>
>>> Comments in the code state that "A typegroup table ends with an all-zero
>>> terminator". Add the missing terminators.
>>>
>>> Some of the typegroups did have a terminator of ".offset = 0, .width = 0,
>>> .value = 0,". Replace those terminators with "{ }" (no trailing ',') for
>>> consistency and to excplicitly state "this is a terminator".
>>>
>>> Fixes: 67d637516fa9 ("net: microchip: sparx5: Adding KUNIT test for the VCAP API")
>>> Cc: Steen Hegelund <steen.hegelund@microchip.com>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> resend: forgot to copy netdev@.
>>
>> You are missing the target tree in the subject - in this case it should be
>> 'net'
> 
> Sorry, I seem to be missing something. The subject starts with
> "net: microchip: vcap: Add ...". How should it look like instead ?

The correct subject should have been:

[PATCH net RESEND] net: microchip: vcap: Add typegroup table terminators
in kunit tests

the target tree is identified by the subj prefix - whatever is enclosed
by []:

https://elixir.bootlin.com/linux/v6.11.8/source/Documentation/process/maintainer-netdev.rst#L12

Please don't resent this patch just to address the above, but please
keep in mind for future submissions.

Thanks,

Paolo


