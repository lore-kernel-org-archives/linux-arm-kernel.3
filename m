Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7EACA9EDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHaZjZ/K9HkcWHP0xoN3hdI7zGw/VH12N/DXI78bY9w=; b=MUxPaIy/A3+4dHr3xf2tNEBcqB
	6sHK2Sswyr34tuNTJKjlwBxBBzXTAgcPB4fRyjg2EMDCcXiTfcqmhGjEoN0YrCy6FO+oYNj+4LPKG
	K2KhtGkS4To00ppvFy7weXUZFTwSXAjYJIrV4IH7rcSoObDzRhmRekzKexofQYq3OfpAq9JvozZZN
	BkNf13cZSnGEBT0Lz3rS+6Ua8sVYot4/0FksSdBQxkoW5fwrvI5QUlusyv+MWro8W08iLsekaJWkl
	6WBSlorcVOLdCRIIiGhzvs5MILvCj7hzXki1KYMN0ix67q/Y2i3n0S2KLPjLAlMToQLh1oK1ZhJkE
	o6PFcnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHyL-0000000AnyY-3fs2;
	Mon, 12 Oct 2026 15:29:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHyI-0000000AnyC-2xVZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:29:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49ff680331aso16099025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818988; x=1792423788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dHaZjZ/K9HkcWHP0xoN3hdI7zGw/VH12N/DXI78bY9w=;
        b=HEQOPdzfCOD3mAE/agwxz78gLxe/ROLOPl0P4UbG33YbmoYVtNLir/fS8LlBuElWAJ
         M5FeutHdyxJBo3UDQdWGGD0+/cgRCKQhXYmyvowCC/HB9Ek3M0R3PjlfN6R6tgebJ10J
         sht73XuPqz8jqTJxohfHc813W2QBDRjzg9HROBu/iJgfILFLQxVsidIGt/cjlQhdML3k
         HFCS6PfR1iCxYCMOaqgPoh0wmnA42x9ikVHP4WgVgC0/yK0BVQYH5bo28tPERMGnLwwm
         tixSn2xnmhs0wWyqrPR/jgxLd+//5JeoCAUfiTPKS8f3vQ6j+cYjsG7OzhApuDsSLGVG
         D5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818988; x=1792423788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHaZjZ/K9HkcWHP0xoN3hdI7zGw/VH12N/DXI78bY9w=;
        b=q4Hk56m2+jC+ibg1364spXTmdoWIQINZ6yWdzqpcR7WNodBvbX088DqEBj1cizHy2l
         3H8SoZKYkUCJ9/dTl0MyKJFU9/QuOIIcwi8vggqSdcWsVU7mqCWjrTSjrwGRicTVV9XC
         TXndGxofkz67E7eEY5iLJnTQyDSIwoPmZFhMDXyh70vQpy+JZ+D/w6yMm7eN418D1+Q5
         0do781SaY6kmwIUFOY31fDSnY/J7S0QCXWfW8AAYMh561qmev11yTFnJZm6MjpzeMw+C
         RkDbIMIPNKVuTG4jX15LeTRWXe1lifncCrL2xgWk5KlYLtc/uw3/T7I9lt7RYEKUyDDN
         llhw==
X-Forwarded-Encrypted: i=1; AKwUvByhJ33Y8VKhCiWN/I2BBLB8q+TIqJVoBAWxe5RRyt+IqMCaHvV65snJsCiZ9HU7Hoo89gCYQ6/E8ql+336r0jPv@lists.infradead.org
X-Gm-Message-State: AFq9FYLV7ro4gg7j92xZwv7gn3UlfUuHNenG3Fvnsk6t6Jt7noLJd0MW
	iPKY/0GeckaSQECPfJfe4nf8SLvJ5a8JbThFr/quco2Zsnq3ONy4rYxp
X-Gm-Gg: AYBFou3jIFKgR+40qU5s02wOAzJUYAD2ASN5hh5H71XRi8ldCRvvYYXwkagSQaRrBh0
	a9MqXCRVOLE8SJ/sxs+eFLecdMH4xi9BAOIQp722CWG3PboQ8DX2ND2XWo0C9g6fm1+7pVy+1HS
	SQ9fa1x/THDSUSo+/6rdZ+FzpSIzDpjjpn4rwdQk/Hosr+HUTJRka/MMjAx9JNGK40nyWzbd1Hb
	NuPoXvgZbxcy3USAJwdh/89RRhtYGhAmAM7t+Z2RcdWvKW17cfkme8G9+b6qOxSBI7y7StNvmmK
	vKkJRPWFj6wdn52WV+cPuFGVnfRc4waxtL9DNVYzIJD88PLUR/A/eCf3dVlbCcIpm09DNWu6opt
	mryuAVDPgtlGh1cIV66dLJrOuhdd1OvBcMbc8SdmBeZqcI/cLYeYFHMLrrYPJwfZu1qXliWdpLb
	5cmxi6sgUy14W2dsMwaH7CAYHzbe3sG3kuUR0Rrw9Fj1guHllXMSS48iAfZboW7puX3hP/6d9H5
	NBJQcbhsVPD6l0wbUbVbTZuPuyj8xKPZkIEtsco5Vz7B19UGHLJ3uGeFfNpYj+9lBiS95McO6MH
	MfRebvF+WDfi5tcu2oKkskPwSbFrSeqR4yw=
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a18e4841c1mr177576875e9.14.1791818988354;
        Mon, 12 Oct 2026 08:29:48 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm299058135e9.15.2026.10.12.08.29.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:29:47 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 2/6] dma-buf: Add get_phys() to describe a physical run
Date: Mon, 12 Oct 2026 15:29:46 +0000
Message-ID: <20261012152946.63489-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012144616.GF14213@ziepe.ca>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com> <20261005132046.30025-1-griffoul@gmail.com> <f0077cec-10fe-400a-b229-f7434e297364@amd.com> <20261012144616.GF14213@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_082950_770307_BBA78E91 
X-CRM114-Status: GOOD (  16.82  )
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

On Mon, Oct 12, 2026 at 11:46:16AM -0300, Jason Gunthorpe wrote:
> I don't want to keep expanding this hack in iommufd. If dmabuf is to
> be used then dmabuf needs to provide a pluggable way to fill the
> iommu_domain that many exporters can plug into. I don't want to
> hardwire every exporter into iommufd, that makes no sense.
>
> The existing arrangement is to motivate solving this problem
> generically, not something to be expanded on.

Agreed. The iommufd registry I mentioned above was never posted, and I
have dropped it.

The series I posted since takes another route, without dma-buf:

  https://lore.kernel.org/all/20261006183235.16576-1-griffoul@gmail.com/

It adds a small interface in mm for drivers that own memory. Such a
driver hands out files, and for each page of a file it tells the caller
which frame backs it. iommufd maps the file with IOMMU_IOAS_MAP_FILE and
builds the iommu_domain itself, and the driver revokes a range when it
changes. So iommufd never knows which driver it is talking to, and there
is no symbol_get(). guest_memfd uses the same files for the guest. The
iommufd part is patch 5:

  https://lore.kernel.org/all/20261006183235.16576-6-griffoul@gmail.com/

The iommufd part is mainly there to show the interface, and it needs
more work. Its revoke unmaps and then remaps, so a device can hit a
hole. I would rebuild it on the REPLACE operation David discussed with
you at LPC, with the scratch page as a quirk on the IOAS.

Is this the kind of generic interface you had in mind, or would you
rather have it hang off dma-buf?

Thanks,
Fred

